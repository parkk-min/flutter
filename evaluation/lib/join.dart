import 'package:flutter/material.dart';

class Join extends StatefulWidget {
  const Join({super.key});

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
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
