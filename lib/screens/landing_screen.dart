import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/screens/auth_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
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
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: pi / 2.4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      topLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                    /*boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 6,
                      )
                    ],*/
                    color: Colors.grey,
                  ),
                  width: 80.0,
                  height: 80.0,
                  child: RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.play_arrow_rounded,
                        size: 60.0,
                      ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'MoveiizPLAY',
                style: TextStyle(fontSize: 26.0, color: Colors.white),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                child: Text(
                  'Watch unlimited movies and TV shows anywhere & anytime!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
              SizedBox(height: 30.0,),
              Container(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreen()));
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
