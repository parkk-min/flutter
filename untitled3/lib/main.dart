import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:untitled3/login_jwt/dice.dart';
import 'package:untitled3/login_jwt/userinfo.dart';
import 'package:untitled3/login_jwt/token_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Token(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: MyPage());
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
    // final headers = {"Content-Type": "application/json"};
    final body = user.toJson();

    try {
      final response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        final token = response.headers['authorization'];
        provider.accessToken = token!;
        return true;
        // showSnackBar(context, "로그인 성공");
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
        title: Text("Login"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      key: ValueKey(1),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please, input username";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        username = value!;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "username",
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
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
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "password",
                        contentPadding: EdgeInsets.all(10),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (tryValidation()) {
                          loginRequest().then((data) {
                            if (data) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Dice()),
                              );
                            }
                          });
                        } else {
                          showSnackBar(context, "올바른 계정 정보를 입력하세요");
                        }
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
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
        style: TextStyle(fontSize: 25),
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
    ),
  );
}
