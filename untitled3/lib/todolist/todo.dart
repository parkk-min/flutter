import 'package:flutter/material.dart';

class Todo {
  final int? id;
  final String title;
  final bool completed;

  Todo({this.id, required this.title, required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'completed': this.completed,
    };
  }


}
