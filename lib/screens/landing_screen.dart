import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/widgets/reusable_btn.dart';
import 'package:movie_stream/screens/auth_screen.dart';

import '../style_constants.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecorationImage,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.black.withOpacity(0.6),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Transform.rotate(
                  angle: pi / 2.4,
                  child: Container(
                    decoration:
                        kBoxDecorationAll.copyWith(color: Color(0xffEEEEEE)),
                    width: 80.0,
                    height: 80.0,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.play_arrow_rounded,
                        size: 60.0,
                        color: Color(0xFF17181F),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
               RichText(text: TextSpan(
                 children: [
                   TextSpan(text: 'Moveiiz', style: kTextStyleLarge.copyWith(fontWeight: FontWeight.w400, letterSpacing: 0.5)),
                   TextSpan(text: 'PLAY', style: kTextStyleLarge.copyWith(fontWeight: FontWeight.w600, color: Color(0xffBD4B4B), letterSpacing: 0.5)),
                 ]
               )),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  child: Text(
                    'Watch unlimited movies and TV shows anywhere & anytime!',
                    textAlign: TextAlign.center,
                    style: kTextStyleSmall.copyWith(
                        fontSize: 20.0,
                        color: Color(0xffEEEEEE),
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
               ReusableButton(btnText: 'Get Started', btnColor: 0xFFBD4B4B, btnTextColor: 0xffEEEEEE, function: () => Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => AuthScreen(),
                 ),
               ),
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
