import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
