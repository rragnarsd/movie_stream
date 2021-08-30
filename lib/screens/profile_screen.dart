import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0,
        horizontal: 20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'George Albert',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'georgealbert@gmail.com',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProfileCard(
                  text: 'Favorite',
                  icon: Icons.favorite,
                ),
                ProfileCard(
                  text: 'History',
                  icon: Icons.history,
                ),
                ProfileCard(
                  text: 'Bookmark',
                  icon: Icons.bookmark,
                ),
              ],
            ),
            SizedBox(height: 40.0,),
            ProfileTile(
              text: 'Update Profile',
            ),
            SizedBox(height: 10.0,),
            ProfileTile(
              text: 'Notifications',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String text;

  ProfileTile({required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            shape: BoxShape.rectangle,
            color: Colors.grey.shade400
          ),
          child: ListTile(
              title: Text(text),
              trailing: Icon(Icons.chevron_right),
              onTap: () => {}),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String text;
  final IconData icon;

  ProfileCard({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.0,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(5.0),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            //ath
            color: Colors.grey.shade400,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Icon(
                icon,
                size: 40.0,
              ),
              Text(text)
            ]),
          ),
        ),
      ),
    );
  }
}
