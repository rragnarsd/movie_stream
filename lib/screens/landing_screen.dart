import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.2), BlendMode.dstATop,
          ),
          image: NetworkImage(
              'https://images.unsplash.com/photo-1584905066893-7d5c142ba4e1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.grey,
                width: 80.0,
                height: 80.0,
                child: Center(child: Text('Logo')),
              ),
              SizedBox(height: 15.0),
              Text(
                'AppName',
                style: TextStyle(fontSize: 26.0, color: Colors.white),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: 250.0,
                child: Text(
                  'Watch and find movies that bring your mood back',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
