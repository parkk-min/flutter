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
      backgroundColor: Colors.blue,
      body: SafeArea(
        // 최 상단 시스템 영역을 차지 하지 않게 해주는 함수
        child: Container(
          width: 200,
          height: 200,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: Colors.red, width: 3.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(200), // 투명도 0~255까지
                blurRadius: 10,
                offset: Offset(7, 7),
              ),
              BoxShadow(
                color: Colors.redAccent.withAlpha(200),
                blurRadius: 10,
                offset: Offset(-7, -7),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              "assets/image1.jpg",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
