import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_stream/provider/provider.dart';
import 'package:movie_stream/screens/landing_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
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
      home: Scaffold(body: LandingScreen()),
    );
  }
}
