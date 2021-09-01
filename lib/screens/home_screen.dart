import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/screens/get_latest_widget.dart';
import 'package:movie_stream/screens/movie_category.dart';
import 'package:movie_stream/screens/now_playing_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
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
