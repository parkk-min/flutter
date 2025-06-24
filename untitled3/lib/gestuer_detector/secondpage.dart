import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("SecondPage"),
        centerTitle: true,
      ),
      backgroundColor: Colors.purple,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/image1.jpg"),
            radius: 100,
          ),
        ),
      ),
    );
  }
}
