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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    color: Color(0xff2d2f3c),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade900,
                        offset: const Offset(0, 1.0),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
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
                          style: TextStyle(fontSize: 22.0, color: Color(0xffEEEDF0), fontWeight: FontWeight.w500, letterSpacing: 1.0),
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
                              color: Color(0xffeeedf0)
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.star,
                            size: 16.0,
                            color: Color(0xffcb69c1),
                          )
                        ]),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          movie.overview,
                          style: TextStyle(fontSize: 16.0, color: Color(0xffeeedf0)),
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
                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                              child: Text(
                                'Go Back',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18.0, color: Color(0xff17181f), letterSpacing: 1.0, fontWeight: FontWeight.w500),
                              ),
                            ),
                            color: Color(0xffEEEDF0),
                            /*color: Colors.grey.shade400,*/
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              'Continue',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18.0, color: Color(0xffeeedf0), letterSpacing: 1.0, fontWeight: FontWeight.w500),
                            ),
                          ),
                          color: Color(0xff6c72cb)
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
