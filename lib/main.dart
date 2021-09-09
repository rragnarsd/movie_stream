import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_stream/provider/provider.dart';
import 'package:movie_stream/screens/landing_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

int? notFirstTime;

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
          accentColor: Color(0xFFBD4B4B),
          splashColor: Color(0xFFEFB7B7),
          buttonColor: Color(0xFFBD4B4B),
          textTheme: TextTheme(subtitle2: TextStyle(color: Colors.green)),
          iconTheme: IconThemeData(color: Color(0xFFBD4B4B)),
        ),
        home: Scaffold(
          body: LandingScreen(),
        ),
    );
  }
}
