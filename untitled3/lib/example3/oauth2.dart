import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/config/palette.dart';
import 'package:untitled3/example3/signin_signup_provider.dart';

class Oauth2 extends StatelessWidget {
  const Oauth2({super.key});

  @override
  Widget build(BuildContext context) {
    SignInProvider provider = context.read<SignInProvider>();
    // provider 에서 watch 사용시 읽기,쓰기가 모두 가능 하지만
    // 위에 적용 한 것 처럼 read 를 사용 하면 가볍게 읽기만 적용 된다.
    return Positioned(
      top: MediaQuery.of(context).size.height - 250,
      right: 0,
      left: 0,
      child: Column(
        children: [
          Text(provider.isSignUp ? "or SignUp with" : "of SignIn with"),
          SizedBox(height: 10),
          TextButton.icon(
            onPressed: () {

            },
            label: Text("Google"),
            icon: Icon(Icons.add),
            style: TextButton.styleFrom(
              backgroundColor: Palette.googleColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
