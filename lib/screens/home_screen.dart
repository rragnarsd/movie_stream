import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/widgets/reusable_btn.dart';
import 'package:movie_stream/widgets/get_latest_widget.dart';
import 'package:movie_stream/widgets/movie_tabs_category.dart';
import 'package:movie_stream/widgets/now_playing_widget.dart';

import '../youtube_video.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Video(),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                children: [
                  GetLatestWidget(),
                  SizedBox(
                    height: 40.0,
                  ),
                  GetLatest(),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    child: ReusableButton(
                      btnText: 'Explore All',
                      btnColor: 0xffbd4b4b,
                      btnTextColor: (0xffEEEEEE),
                      function: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieTabsCategory(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

