import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/screens/get_latest_widget.dart';
import 'package:movie_stream/screens/movie_tabs_category.dart';
import 'package:movie_stream/screens/now_playing_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../style_constants.dart';

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
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xffbd4b4b),),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieTabsCategory(),
                            ));
                      },
                      child: Text(
                        'Explore All',
                        style: kTextStyleSmall,
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

class Video extends StatefulWidget {
  final url;

  Video({this.url});

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late YoutubePlayerController controller;

  void runYouTubePlayer() {
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
              'https://www.youtube.com/watch?v=BDSa0JhIUMI&t=19s')
          .toString(),
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void initState() {
    runYouTubePlayer();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
        ),
        builder: (context, player) {
          return Container(child: player);
        });
  }
}
