import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/example3/background.dart';
import 'package:untitled3/example3/oauth2.dart';
import 'package:untitled3/example3/signin_signup.dart';
import 'package:untitled3/example3/submit.dart';
import 'package:untitled3/example3/signin_signup_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SignInProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: MyPage());
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [Background(), SignInSignUp(), Submit(), Oauth2()]),
    );
  }
}
