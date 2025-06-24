import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Text("Appbar icon menu"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print("장바구니 클릭!");
            },
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {
              print("검색 클릭!");
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red[700],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              accountName: Text("Park min gyu"),
              accountEmail: Text("pmg0821@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/img1.gif"),
                radius: 40,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.grey[800]),
              title: Text("Home"),
              trailing: Icon(Icons.add),
              onTap: () {
                print("Home Click");
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color: Colors.grey[800]),
              title: Text("Q&A"),
              trailing: Icon(Icons.add),
              onTap: () {
                print("Q&A Click");
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.grey[800]),
              title: Text("Settings"),
              trailing: Icon(Icons.add),
              onTap: () {
                print("Settings Click");
              },
            ),
          ],
        ),
      ),
    );
  }
}


