import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("ScreenA")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/b");
              },
              child: Text("Go to ScreenB"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/c");
              },
              child: Text("Go to ScreenC"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
