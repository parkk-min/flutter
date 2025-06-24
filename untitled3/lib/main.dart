import 'package:flutter/material.dart';
import 'package:untitled3/config/palette.dart';

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
  bool isSignUp = true;

  String userName = "";
  String userEmail = "";
  String userPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
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
                            text: isSignUp ? " to My WebPage" : " go back",
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
                      isSignUp ? " SignUp to continue" : " SignIn to continue",
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
          ),
          Positioned(
            top: 180,
            child: Container(
              height: isSignUp ? 280 : 250,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    blurRadius: 10,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignUp = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNIN",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignUp
                                      ? Palette.activeColor
                                      : Palette.textColor1,
                                ),
                              ),
                              if (!isSignUp)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignUp = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignUp
                                      ? Palette.activeColor
                                      : Palette.textColor1,
                                ),
                              ),
                              if (isSignUp)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (isSignUp)
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 4) {
                                    return "Please enter at least 4 characters";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  userName = value!;
                                },
                                key: ValueKey(1),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Palette.iconColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Palette.textColor1,
                                    ),
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  hintText: "User Name",
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Palette.textColor2,
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty || value.contains("@")) {
                                    return "Please enter valid email address";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  userEmail = value!;
                                },
                                key: ValueKey(2),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Palette.iconColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Palette.textColor1,
                                    ),
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  hintText: "User Email",
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Palette.textColor2,
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 4) {
                                    return "Please must be at least 7 characters long";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  userPassword = value!;
                                },
                                key: ValueKey(3),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Palette.iconColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Palette.textColor1,
                                    ),
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  hintText: "User Password",
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Palette.textColor2,
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                ),
                                obscureText: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (!isSignUp)    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty || value.contains("@")) {
                                  return "Please enter valid email address";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userEmail = value!;
                              },
                              key: ValueKey(4),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                hintText: "User Email",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Palette.textColor2,
                                ),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty || value.length < 4) {
                                  return "Please must be at least 7 characters long";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userPassword = value!;
                              },
                              key: ValueKey(5),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1,
                                  ),
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                hintText: "User Password",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Palette.textColor2,
                                ),
                                contentPadding: EdgeInsets.all(10),
                              ),
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
