import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:untitled3/login_jwt/token_provider.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> with SingleTickerProviderStateMixin {
  int leftDice = 1;
  int rightDice = 1;
  bool admin = false;
  String? errorMessage = null;
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  bool _isRolling = false;

  @override
  void initState() {
    super.initState();
    // 애니메이션 컨트롤러: 1초 동안 회전
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    // 회전 애니메이션 (0 ~ 2π)
    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14159).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> adminRequest() async {
    Token provider = context.read<Token>();
    final url = Uri.parse("http://10.0.2.2:8080/admin");
    final headers = {"authorization": provider.accessToken};

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        admin = true;
      } else if (response.statusCode == 403) {
        errorMessage = utf8.decode(response.bodyBytes);
      }
    } catch (e) {
      print("Error: ${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(backgroundColor: Colors.white, title: Text("Dice Game")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _isRolling ? _rotationAnimation.value : 0,
                          child: Image.asset(
                            _isRolling
                                ? "assets/images/dice${Random().nextInt(6) + 1}.png"
                                : "assets/images/dice${leftDice}.png",
                            width: 300,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _isRolling ? _rotationAnimation.value : 0,
                          child: Image.asset(
                            _isRolling
                                ? "assets/images/dice${Random().nextInt(6) + 1}.png"
                                : "assets/images/dice${rightDice}.png",
                            width: 300,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: _isRolling
                  ? null // 굴리는 중에는 버튼 비활성화
                  : () async {
                await adminRequest();
                if (admin) {
                  setState(() {
                    _isRolling = true;
                  });
                  _controller.forward(from: 0); // 애니메이션 시작
                  await Future.delayed(const Duration(seconds: 1));
                  setState(() {
                    leftDice = Random().nextInt(6) + 1;
                    rightDice = Random().nextInt(6) + 1;
                    _isRolling = false;
                  });
                } else {
                  showToast(errorMessage ?? '권한이 없습니다.');
                }
              },
              child: Icon(Icons.play_arrow, color: Colors.white, size: 50),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 25,
      backgroundColor: Colors.white,
      textColor: Colors.orangeAccent,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }
}