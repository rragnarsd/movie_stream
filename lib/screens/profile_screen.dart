import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/auth/auth_screen.dart';
import 'dart:math' as math;
import 'package:movie_stream/screens/favorite_screen.dart';
import 'package:movie_stream/screens/landing_screen.dart';
import 'package:movie_stream/screens/reviews_screen.dart';
import 'package:movie_stream/screens/watched_screen.dart';

import '../style_constants.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({required this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isSigningOut = false;
  late User _currentUser;

  @override
  void initState() {
   _currentUser = widget.user;
    super.initState();
  }

  void signOutTheUser() async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AuthScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(),
          Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text(
                '${_currentUser.displayName}',
               /* 'George Albert',*/
                style: kTextStyleMedium.copyWith(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '${_currentUser.email}',
                /*'georgealbert@gmail.com',*/
                style: kTextStyleSmall.copyWith(
                  fontSize: 16.0,
                  color: Color(0xffEEEEEE),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
            ],
          ),
              /*ProfileAbout( ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileCard(
                    text: 'Favorite',
                    icon: Icons.favorite,
                    widget: FavoriteScreen(),
                  ),
                  ProfileCard(
                    text: 'History',
                    icon: Icons.history,
                    widget: WatchedScreen(),
                  ),
                  ProfileCard(
                    text: 'Reviews',
                    icon: Icons.reviews,
                    widget: ReviewsScreen(),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
            /*  ProfileTile(
                text: 'Notifications',
              ),*/
              SizedBox(
                height: 10.0,
              ),
          Material(
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                    tileColor: Color(0xff2d2f3c),
                    title: Text(
                      'Sign Out',
                      style: TextStyle(
                        color: Color(0xffEEEEEE),
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Color(0xffEEEEEE),
                    ),
                    onTap: signOutTheUser,
                    )),
              ),
            ),
             /* ProfileTile(
                text: 'Sign Out',
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileAbout extends StatefulWidget {
  final User user;

  ProfileAbout({required this.user});
  @override
  _ProfileAboutState createState() => _ProfileAboutState();
}

class _ProfileAboutState extends State<ProfileAbout> {
  bool _isSendingVerification = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        Text(
          'George Albert',
          style: kTextStyleMedium.copyWith(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'georgealbert@gmail.com',
          style: kTextStyleSmall.copyWith(
            fontSize: 16.0,
            color: Color(0xffEEEEEE),
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Stack(children: [
      AnimatedBuilder(
        animation: _controller,
        child: Center(
          child: Container(
            width: 130.0,
            height: 130.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFFEEEEEE), Color(0xFFBD4B4B)],
              ),
            ),
          ),
        ),
        builder: (BuildContext context, child) {
          return Transform.rotate(
            angle: _controller.value * 2.0 * math.pi,
            child: child,
          );
        },
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(
            radius: 60.0,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80'),
          ),
        ),
      ),
    ]);
  }
}

/*class ProfileTile extends StatelessWidget {
  final String text;

  ProfileTile({required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
              tileColor: Color(0xff2d2f3c),
              title: Text(
                text,
                style: TextStyle(
                  color: Color(0xffEEEEEE),
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Color(0xffEEEEEE),
              ),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LandingScreen()),
                  )),
        ),
      ),
    );
  }
}*/

class ProfileCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Widget widget;

  ProfileCard({required this.text, required this.icon, required this.widget});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 110.0,
        height: 110.0,
        decoration: kBorderRadiusWithShadows,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(children: [
            Icon(
              icon,
              size: 40.0,
              color: Color(0xffeeedf0),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              text,
              style: TextStyle(color: Color(0xffBD4B4B), letterSpacing: 1.0),
            )
          ]),
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widget),
      ),
    );
  }
}
