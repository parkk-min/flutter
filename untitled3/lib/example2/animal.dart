import 'package:flutter/material.dart';

class Animal {
  final String name;
  final String imagePath;
  final String location;
  int likeCount = 0;

  Animal({required this.name,
    required this.imagePath,
    required this.location});
}