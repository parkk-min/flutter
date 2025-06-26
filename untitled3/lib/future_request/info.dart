import 'package:flutter/material.dart';

class Info {
  final int id;
  final String userName;
  final int account;
  final int balance;

  Info({
    required this.id,
    required this.userName,
    required this.account,
    required this.balance,
  });

  // factory 는 무조건 반환 값이 있어야 한다. 현재 객체를 만든 값을 반환
  factory Info.fromJson(Map<dynamic, dynamic> json) {
    return Info(
      id: json['id'] ?? "",
      userName: json['userName'] ?? "",
      account: json['account'] ?? "",
      balance: json['balance'] ?? "",
    );
  }
}
