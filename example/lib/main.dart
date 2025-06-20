import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      appBar: AppBar(
        title: Text("LG TWINS"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[600],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("asset/image1.jpg"),
              radius: 60.0,
            ),
            Divider(height: 50.0, color: Colors.grey[900], thickness: 3),
            SizedBox(height: 10.0),
            Text(
              "Team Name",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            SizedBox(height: 10.0),
            Text(
              "LG TWINS",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25.0),
            Text("창단 년도", style: TextStyle(color: Colors.white, fontSize: 15)),
            SizedBox(height: 10.0),
            Text(
              "1990",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25.0),
            Text("우승 년도", style: TextStyle(color: Colors.white, fontSize: 15)),
            SizedBox(height: 10.0),
            TextButton.icon(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red[900],
                    content: Text(
                      "2025년도 우승!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                    duration: Duration(seconds: 3),
                  ),
                );
              },
              label: Text(
                "1990, 1994, 2023",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              ),
              icon: Icon(
                Icons.coffee_rounded,
                size: 30,
                color: Colors.yellow[800],
              ),
            ),
            SizedBox(height: 10.0),
            Text("현 감독", style: TextStyle(color: Colors.white, fontSize: 15)),
            SizedBox(height: 10.0),
            TextButton.icon(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "곧 교체 될 예정",
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.deepPurple[900],
                  fontSize: 30,
                  textColor: Colors.amber,
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
              label: Text(
                "염경엽",
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                ),
              ),
              icon: Icon(
                Icons.delete_forever,
                size: 30,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
