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

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String result = "no data";
  late Future<void> _futureData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureData = futureTest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Future Test"), centerTitle: true),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  futureTest();
                  print("버튼 눌림");
                },
                child: Text("Future Test", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 20),
              Text(
                result,
                style: TextStyle(fontSize: 20, color: Colors.redAccent),
              ),
              Divider(height: 20, thickness: 2),
              FutureBuilder(
                future: _futureData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text(
                      result,
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> futureTest() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      result = "The data is fetched";
    });
  }

  Future<String> myFuture() async {
    await Future.delayed(Duration(seconds: 2));
    return "another Future completed";
  }
}
