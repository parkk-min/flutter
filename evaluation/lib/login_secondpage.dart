import 'package:flutter/material.dart';

class LoginSecondPage extends StatefulWidget {
  const LoginSecondPage({super.key});

  @override
  State<LoginSecondPage> createState() => LoginSecondPageState();
}

class LoginSecondPageState extends State<LoginSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.withAlpha(100),
        title: Text(
          "Second Page",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Center(child: Text("로그인 성공", style: TextStyle(fontSize: 30))),
    );
  }
}
