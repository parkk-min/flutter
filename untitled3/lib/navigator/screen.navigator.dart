import 'package:flutter/material.dart';
import 'screena.dart';
import 'screenb.dart';
import 'screenc.dart';

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
        "/": (context) => ScreenA(),
        "/b": (context) => ScreenB(),
        "/c": (context) => ScreenC(),
      },
    );
  }
}
