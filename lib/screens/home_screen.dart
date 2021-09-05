import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/widgets/get_latest_widget.dart';
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

