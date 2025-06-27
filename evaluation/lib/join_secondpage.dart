import 'package:flutter/material.dart';

class JoinSecondPage extends StatefulWidget {
  const JoinSecondPage({super.key});

  @override
  State<JoinSecondPage> createState() => _JoinSecondPageState();
}

class _JoinSecondPageState extends State<JoinSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.withAlpha(100),
        title: Text(
          "Join Page",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }
}
