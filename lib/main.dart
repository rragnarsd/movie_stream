import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_stream/screens/auth_screen.dart';
import 'package:movie_stream/screens/home_screen.dart';
import 'package:movie_stream/screens/landing_screen.dart';
import 'package:movie_stream/screens/movie_tabs_category.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:movie_stream/screens/profile_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF17181F),
        primaryColor: Color(0xFF6C72CB),
        splashColor: Color(0xFFCB9C1),
        iconTheme: IconThemeData(color: Color(0xFF17181f)),
      ),
      home: Scaffold(
        body: LandingScreen()

      /*  BottomNavigationBar()*/
      ),
    );
  }
}

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: [
            HomeScreen(),
            MovieTabsCategory(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        itemCornerRadius: 10.0,
        backgroundColor: Colors.black,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Color(0xffBD4B4B),
            inactiveColor: Color(0xffEEEDF0),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.explore),
            title: Text('Explore'),
            activeColor: Color(0xffBD4B4B),
            inactiveColor: Color(0xffEEEDF0),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80'),
            ),
            title: Text('Profile'),
            activeColor: Color(0xffBD4B4B),
            inactiveColor: Color(0xffEEEDF0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
