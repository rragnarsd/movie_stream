import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_stream/provider/provider.dart';
import 'package:movie_stream/screens/landing_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottomNavy.dart';

int? notFirstTime;

void main() async {
  await dotenv.load(fileName: ".env");
  //Check if the user has visited the app before - if so do not show the landing screen
  SharedPreferences preferences = await SharedPreferences.getInstance();
  notFirstTime = preferences.getInt('landingScreen');
  runApp(
    ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
/*  final User user;

  MyApp({required this.user});*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
              child,
              maxWidth: 1200,
              minWidth: 450,
              defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint.resize(450, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
            ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF17181F),
          primaryColor: Color(0xFFBD4B4B),
          splashColor: Color(0xFFEFB7B7),
          buttonColor: Color(0xFFBD4B4B),
          iconTheme: IconThemeData(color: Color(0xFFEEEEEE)),
        ),
        home: Scaffold(
          /* body: notFirstTime != 0 ? LandingScreen() : BottomNavy(user: )*/
          body: LandingScreen(),
          /*BottomNavy(user: ),*/
        ));
  }
}
