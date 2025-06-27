import 'package:evaluation/join.dart';
import 'package:evaluation/login.dart';
import 'package:evaluation/token.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Token(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.withAlpha(100),
        title: Text(
          "MinGyu Word",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 300),
            ListTile(
              leading: Icon(Icons.home, color: Colors.grey[700], size: 40),
              title: Text("Home"),
              onTap: () {}, // 클릭 이벤트
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Text(
            "MinGyu HomePage",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.amber,
            ),
          ),
          SizedBox(height: 40),
          Text("Welcome!!", style: TextStyle(fontSize: 22)),
          SizedBox(height: 120),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.login, color: Colors.blue),
                    SizedBox(width: 5),
                    Text(
                      "로그인",
                      style: TextStyle(fontSize: 30, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 50),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Join()),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.person_add, color: Colors.green),
                    SizedBox(width: 5),
                    Text(
                      "회원가입",
                      style: TextStyle(fontSize: 30, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
