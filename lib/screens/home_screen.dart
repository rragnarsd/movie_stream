import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/screens/get_latest_widget.dart';
import 'package:movie_stream/screens/movie_category.dart';
import 'package:movie_stream/screens/now_playing_widget.dart';
import 'package:movie_stream/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(right: 20.0, left: 10.0, bottom: 10.0),
            child: InkWell(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80'),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              GetLatestWidget(),
              SizedBox(
                height: 40.0,
              ),
              GetLatest(),
              SizedBox(
                height: 40.0,
              ),
              Container(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => MovieCategory(),
                    )
                    );},
                  child: Text('Explore All', style: TextStyle(fontSize: 18.0),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
