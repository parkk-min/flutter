import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: Text("Container 1"),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: Text("Container 2"),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: Text("Container 3"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
