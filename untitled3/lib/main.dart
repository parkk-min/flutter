import 'package:flutter/material.dart';
import 'package:untitled3/todo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

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
  List<Todo>? todoList = null;

  Future<void> fetchData() async {
    final url = Uri.parse("http://10.0.2.2:8080/todo-list");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(
          utf8.decode(response.bodyBytes),
        );
        todoList = responseData.map((json) => Todo.fromJson(json)).toList();
      }
    } catch (e) {
      print("error : ${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Get Request Example")),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: todoList!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(todoList![index].title),
                    trailing: Icon(
                      todoList![index].completed
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: todoList![index].completed
                          ? Colors.green
                          : Colors.grey,
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Todo 추가")),
          ],
        ),
      ),
    );
  }
}
