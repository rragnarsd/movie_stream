import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey,
              width: 60.0,
              height: 60.0,
            ),
            SizedBox(height: 10.0),
            Text(
              'AppName',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'About the App',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
