import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/auth/register_screen.dart';

import 'login_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showLogin = true;

  void toggleAuth() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginScreen(
        toggleAuth: toggleAuth,
      );
    } else {
      return RegisterScreen(toggleAuth: toggleAuth);
    }
  }
}
