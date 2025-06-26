import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/example3/signin_signup_provider.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    SignInProvider provider = context.watch<SignInProvider>();
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image2.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 90, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "WelCome",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.0,
                    fontSize: 25,
                  ),
                  children: [
                    TextSpan(
                      text: provider.isSignUp ? " to My WebPage" : " go back",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.0,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Text(
                provider.isSignUp
                    ? " SignUp to continue"
                    : " SignIn to continue",
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
