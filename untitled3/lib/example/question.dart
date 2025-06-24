import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Q & A Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "question page...",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
