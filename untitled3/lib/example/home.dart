import 'package:flutter/material.dart';
import 'package:untitled3/example/question.dart';
import 'package:untitled3/example/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: Colors.amber[200],
        fontFamily: "BlackHanSans",
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 35, color: Colors.deepPurple),
          bodyMedium: TextStyle(fontSize: 20, color: Colors.redAccent),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(),
        "/question": (context) => Question(),
        "/settings": (context) => Settings(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      drawer: AccountDetailsDrawer(),
    );
  }
}

class AccountDetailsDrawer extends StatefulWidget {
  const AccountDetailsDrawer({super.key});

  final String phone = "010-1234-5678";
  final String address = "서울특별시 강남구";

  @override
  State<AccountDetailsDrawer> createState() => _AccountDetailsDrawer();
}

class _AccountDetailsDrawer extends State<AccountDetailsDrawer> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            onDetailsPressed: () {
              setState(() {
                this.showDetails = !this.showDetails;
              });
            },
          ),
          if (this.showDetails)
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
                      Text(
                        "Phone : ${widget.phone}",
                        style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.location_on),
                      ),
                      Text(
                        "Address : ${widget.address}",
                        style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.grey[800]),
            title: Text("Home", style: TextStyle(color: Colors.red)),
            trailing: Icon(Icons.add),
            onTap: () {
              Navigator.pushNamed(context, "/");
              print("Home Click");
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer, color: Colors.grey[800]),
            title: Text("Q&A"),
            trailing: Icon(Icons.add),
            onTap: () {
              Navigator.pushNamed(context, "/question");
              print("Q&A Click");
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.grey[800]),
            title: Text("Settings"),
            trailing: Icon(Icons.add),
            onTap: () {
              Navigator.pushNamed(context, "/settings");
              print("Settings Click");
            },
          ),
        ],
      ),
    );
  }
}
