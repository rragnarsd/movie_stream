import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/constants.dart';
import 'package:movie_stream/models/movie_model.dart';

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
                color: Colors.white,
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade200,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: const Offset(0, 0.4),
                        blurRadius: 10.0,
                        spreadRadius: 0.2,
                      )
                    ]),
                child: Container(
                  width: 350,
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(children: [
                          Text(
                            movie.voteAverage.toString(),
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.star,
                            size: 16.0,
                          )
                        ]),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          movie.overview,
                          style: TextStyle(fontSize: 16.0),
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
                        child: InkWell(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'Go Back',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            color: Colors.grey.shade400,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Continue',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          color: Colors.grey.shade600,
                        ),
                      )
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
