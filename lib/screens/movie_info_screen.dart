import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/constants.dart';
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
      height: 800,
      child: Container(
        height: 900,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                color: Color(0xff17181f),
              ),
            ),
            Positioned(
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
            ),
            Positioned(
              top: 280,
              left: 30,
              child: Container(
                decoration: kBorderRadiusWithShadows,
                child: Container(
                  width: 350,
                  height: 250,
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
                                child: Text(movie.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: kTextStyleMedium),
                              ),
                              Icon(Icons.favorite),
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
                            width: 5.0,
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
            ),
            Positioned(
              child: Column(children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          child: ReusableButton(
                            btnText: 'Go Back',
                            btnTextColor: 0xff17181f,
                            btnColor: 0xffEEEEEE,
                            function: () => Navigator.pop(context),
                          ),
                          width: 50.0,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: ReusableButton(
                              btnText: 'Continue',
                              btnTextColor: 0xffEEEEEE,
                              btnColor: 0xffBD4B4B,
                              function: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FavoriteScreen()))),
                          width: 50.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    ));
  }
}
