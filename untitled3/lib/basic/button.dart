import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: MyPage());
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text(
          "Buttons",
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                print("Text Button Clicked");
              },
              onLongPress: () {
                print("Text 길게 누르기");
              },
              child: Text("Text Button", style: TextStyle(fontSize: 20)),
              style: TextButton.styleFrom(foregroundColor: Colors.red),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                print("엘리베이트드 버튼 클릭!!!!!!");
              },
              child: Text("ElevaridButton"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 20,
              ),
            ),
            SizedBox(height: 20.0),
            OutlinedButton(
              onPressed: () {
                print("테두리 버튼 클릭!!!!!");
              },
              child: Text("OutlineButton"),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.blue,
                side: BorderSide(color: Colors.blueAccent, width: 10),
              ),
            ),
            SizedBox(height: 20.0),
            TextButton.icon(
              onPressed: () {},
              label: Text("Text Label"),
              icon: Icon(Icons.add_a_photo, size: 30, color: Colors.orangeAccent),
              style: TextButton.styleFrom(backgroundColor: Colors.pink),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {}, child: Text("Text Button")),
                ElevatedButton(onPressed: () {}, child: Text("ElevatedButton")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
