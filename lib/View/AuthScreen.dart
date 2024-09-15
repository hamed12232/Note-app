
import 'package:flutter/material.dart';
import 'package:note_app/View/Login.dart';
import 'package:note_app/View/SignUp.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  void toggleAuthScreen() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLogin
                    ? Loginview(toggleScreen: toggleAuthScreen)
                    : SignUpView(toggleScreen: toggleAuthScreen),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
