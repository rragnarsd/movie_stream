import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_stream/auth/auth_screen.dart';
import 'package:movie_stream/auth/login_screen.dart';
import 'package:movie_stream/bottomNavy.dart';
import 'package:movie_stream/provider/provider.dart';
import 'package:movie_stream/screens/home_screen.dart';
import 'package:movie_stream/screens/landing_screen.dart';
import 'package:movie_stream/screens/movie_info_screen.dart';
import 'package:movie_stream/screens/profile_screen.dart';
import 'package:movie_stream/widgets/movie_tabs_category.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      /*    body: notFirstTime != 0 ? LandingScreen() : BottomNavy(user: user)*/
        body: LandingScreen(),
          /*BottomNavy(user: ),*/
        )
    );
  }
}
