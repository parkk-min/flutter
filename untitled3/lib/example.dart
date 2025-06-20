import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(key: Key("god")));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: "god"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String? title;

  const MyHomePage({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      appBar: AppBar(
        title: Text("MinGyu Man"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset("assets/img1.gif", width: 120, height: 120),
            ),
            Divider(
              height: 70.0,
              color: Colors.grey[800],
              thickness: 1,
              // endIndent: 30.0,
            ),
            Text(
              "MinGyu Man",
              style: TextStyle(
                color: Colors.amber[700],
                letterSpacing: 2.0,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "출생년도",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "1875",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(height: 10.0),
                Text(
                  "슈렉",
                  style: TextStyle(letterSpacing: 2.0, fontSize: 16.0),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(height: 10.0),
                Text(
                  "장화신은 고양이",
                  style: TextStyle(letterSpacing: 2.0, fontSize: 16.0),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/img2.gif"),
                backgroundColor: Colors.green[600],
                radius: 60.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
