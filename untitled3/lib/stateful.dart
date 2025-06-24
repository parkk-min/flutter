import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // 변수 앞에 _(under_bar)가 붙으면 private 이 된다. 기본적 으로 dart 언어는 public 이다.
  // class 는 제외
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("버튼을 선택해서 눌러볼래?"),
            Text(
              '$_counter',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    _decrementCounter();
                  },
                  icon: Icon(Icons.remove),
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.inversePrimary,
                  ),
                ),
                SizedBox(height: 20),
                IconButton(
                  onPressed: () {
                    _incrementCounter();
                  },
                  icon: Icon(Icons.add),
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '증가',
        child: const Icon(Icons.add),
      ),
    );
  }
}
