import 'package:flutter/material.dart';
import 'secondpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        "/": (context) => GestureDetectorApp(),
        "/second": (context) => SecondPage(),
      },
    );
  }
}

class GestureDetectorApp extends StatelessWidget {
  const GestureDetectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text("GestureDetectorApp"),
      ),
      backgroundColor: Colors.amber[600],
      body: Center(
        child: GestureDetector(
          onDoubleTap: () {
            Navigator.pushNamed(context, "/second");
          },
          child: Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            child: Text(
              "Click Me",
              style: TextStyle(
                fontSize: 30,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(200),
                  blurRadius: 10,
                  offset: Offset(5, 5),
                ),
              ],
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
