import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:movie_stream/service/constants.dart';
import 'package:movie_stream/models/movie_model.dart';
import 'package:movie_stream/screens/favorite_screen.dart';

import '../widgets/reusable_btn.dart';
import '../style_constants.dart';

class MovieInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as MovieModel;
    return Scaffold(
      body: Container(
        child: Container(
          child: Stack(
            children: [
              MovieInfoBackground(),
              MovieInfoImage(movie: movie),
              MovieInfoCard(movie: movie),
              MovieInfoButton()
            ],
          ),
        ),
      ),
    );
  }
}

class MovieInfoBackground extends StatelessWidget {
  const MovieInfoBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        color: Color(0xff17181f),
      ),
    );
  }
}

class MovieInfoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Column(children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ReusableButton(
                      btnText: 'Watch Movie',
                      btnTextColor: 0xffEEEEEE,
                      btnColor: 0xffBD4B4B,
                      function: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoriteScreen(),
                        ),
                      ),
                    ),
                    width: 50.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class MovieInfoCard extends StatelessWidget {
  const MovieInfoCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      top: 240,
      left: 25,
      child: Container(
        decoration: kBorderRadiusWithShadows,
        child: Container(
          width: 400.0,
          height: 280,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          movie.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: kTextStyleMedium,
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 10.0,
                ),
                Row(children: [
                  Text(
                    movie.voteAverage.toString(),
                    style: kTextStyleSmall.copyWith(
                      color: Color(0xffEEEEEE),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.star,
                    size: 16.0,
                    color: Color(0xffBD4B4B),
                  )
                ]),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  movie.overview,
                  style: kTextStyleXSmall.copyWith(fontSize: 16.0),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MovieInfoImage extends StatelessWidget {
  const MovieInfoImage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        width: double.infinity,
        height: 350,
        child: Hero(
          tag: Text('Hero'),
          child: CachedNetworkImage(
            imageUrl: Constants.imageUrl + movie.posterPath,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
