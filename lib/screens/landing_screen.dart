import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/auth/auth_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../style_constants.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storedInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('landingScreen', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.dstATop,
          ),
          image: NetworkImage(
              'https://images.unsplash.com/photo-1584905066893-7d5c142ba4e1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.black.withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Transform.rotate(
                  angle: pi / 2.4,
                  child: Container(
                    decoration: kBoxDecorationAll.copyWith(
                      color: Color(0xffEEEEEE),
                    ),
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
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Moveiiz',
                      style: kTextStyleLarge.copyWith(
                          fontWeight: FontWeight.w400, letterSpacing: 0.5),
                    ),
                    TextSpan(
                      text: 'PLAY',
                      style: kTextStyleLarge.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Color(0xffBD4B4B),
                          letterSpacing: 0.5),
                    ),
                  ]),
                ),
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
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      _storedInfo();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                           builder: (context) => AuthScreen()
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'Get Started',
                        textAlign: TextAlign.center,
                        style: kTextStyleMedium.copyWith(
                            fontSize: 18.0, color: Color(0xffEEEEEE)),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      elevation: 5.0,
                      primary: Color(0xFFBD4B4B),
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
