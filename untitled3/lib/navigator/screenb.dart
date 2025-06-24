import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("ScreenB")),
      body: Center(child: Text("ScreenB", style: TextStyle(fontSize: 25))),
    );
  }
}
