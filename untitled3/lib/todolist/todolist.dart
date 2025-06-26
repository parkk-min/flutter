import 'package:flutter/material.dart';
import 'package:untitled3/todolist/todo.dart';
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
  String? erroMessage = null;
  late final Future<void> _fetchData;

  @override
  void initState() {
    super.initState();
    _fetchData = fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse("http://10.0.2.2:8080/todo-list");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(
          utf8.decode(response.bodyBytes),
        );
        print("responseData: $responseData");
        setState(() {
          todoList = responseData.map((json) => Todo.fromJson(json)).toList();
          // dynamic 으로 들어온 값을 Todo 로 변환
        });
      } else {
        setState(() {
          erroMessage = "Error: ${response.statusCode}";
        });
      }
    } catch (error) {
      print("error : ${error}");
    }
  }

  Future<void> sendData() async {
    Uri url = Uri.parse("http://10.0.2.2:8080/todo");
    final headers = {"Content-Type": "application/json"};
    final body = json.encode(Todo(title: "달리기", completed: false).toJson());
    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(
          utf8.decode(response.bodyBytes),
        );
        Todo todo = Todo.fromJson(responseData);
        setState(() {
          todoList?.add(todo);
          print("body: $responseData");
        });
      } else {
        setState(() {
          erroMessage = "Error: ${response.statusCode}";
        });
      }
    } catch (error) {
      print("error : ${error}");
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text("Todo List")),
  //     body: Center(
  //       child: Column(
  //         children: [
  //           if (todoList == null)
  //             CircularProgressIndicator()
  //           else
  //             Expanded(
  //               child: ListView.builder(
  //                 itemCount: todoList!.length,
  //                 itemBuilder: (context, index) {
  //                   return ListTile(
  //                     title: Text(todoList![index].title),
  //                     trailing: Icon(
  //                       todoList![index].completed
  //                           ? Icons.check_circle
  //                           : Icons.radio_button_unchecked,
  //                       color: todoList![index].completed
  //                           ? Colors.green
  //                           : Colors.grey,
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ),
  //           ElevatedButton(onPressed: () {}, child: Text("Todo 추가")),
  //           SizedBox(height: 10),
  //           if (erroMessage != null)
  //             Text(erroMessage!, style: TextStyle(fontSize: 20)),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo List")),
      body: FutureBuilder(
        future: _fetchData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            return Center(
              child: Column(
                children: [
                  if (todoList == null)
                    CircularProgressIndicator()
                  else
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
                  ElevatedButton(
                    onPressed: () {
                      sendData();
                    },
                    child: Text("Todo 추가"),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
