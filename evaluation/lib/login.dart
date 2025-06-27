import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:evaluation/token.dart';
import 'package:evaluation/login_secondpage.dart';
import 'package:evaluation/userinfo.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? username = null;
  String? password = null;

  bool tryValidation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> loginRequest() async {
    Token provider = context.read<Token>();

    final url = Uri.parse("http://10.0.2.2:8080/login");
    UserInfo user = UserInfo(username: username!, password: password!);
    final headers = {"Content-Type": "application/x-www-form-urlencoded"};
    final body = user.toJson();

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final token = response.headers['authorization'];
        final refresh = response.headers['set-cookie'];
        provider.accessToken = token!;
        provider.refreshToken = refresh!;
        return true;
      } else if (response.statusCode == 401) {
        final msg = json.decode(utf8.decode(response.bodyBytes));
        showSnackBar(context, msg['error']);
      } else {
        showSnackBar(context, "Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: ${e}");
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.withAlpha(100),
        title: Text(
          "Login Page",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Text(
              "Please enter your ID and password",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 30),
            Container(
              color: Colors.blueAccent.withAlpha(20),
              padding: EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: SizedBox(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.grey[700],
                            size: 30,
                          ),
                          border: UnderlineInputBorder(),
                          hintText: "userID",
                        ),
                        key: ValueKey(1),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please, input userID";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          username = value!;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey[700],
                            size: 30,
                          ),
                          border: UnderlineInputBorder(),
                          hintText: "password",
                        ),
                        obscureText: true,
                        key: ValueKey(2),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please, input password";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          password = value!;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (tryValidation()) {
                  loginRequest().then((data) {
                    if (data) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginSecondPage(),
                        ),
                      );
                    }
                  });
                } else {
                  showSnackBar(context, "올바른 계정 정보를 입력하세요");
                }
              },
              child: Icon(Icons.arrow_forward, color: Colors.white, size: 30),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showSnackBar(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.redAccent,
    ),
  );
}
