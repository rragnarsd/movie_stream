import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/models/movie_model.dart';
import 'package:movie_stream/provider/provider.dart';
import 'package:movie_stream/screens/movie_info_screen.dart';
import 'package:movie_stream/style_constants.dart';
import 'package:provider/provider.dart';

import 'service/constants.dart';
import 'models/movie_result_model.dart';

class MovieCardUi extends StatefulWidget {
  const MovieCardUi({
    Key? key,
    required this.jsonData,
  }) : super(key: key);

  final Future<MovieResults> jsonData;

  @override
  _MovieCardUiState createState() => _MovieCardUiState();
}

class _MovieCardUiState extends State<MovieCardUi> {
  Set<MovieModel> favMovies = Set<MovieModel>();

  @override
  Widget build(BuildContext context) {
    var movieProvider = Provider.of<MovieProvider>(context);

    return FutureBuilder<MovieResults>(
        future: widget.jsonData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.results.length,
              itemBuilder: (context, index) {
                MovieModel title = snapshot.data!.results[index];
                bool isFav = favMovies.contains(title);
                return Row(children: [
                  Expanded(
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.passthrough,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 40.0,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieInfoScreen(),
                                  settings: RouteSettings(
                                    arguments: snapshot.data!.results[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: kBorderRadiusWithShadows,
                              width: 300,
                              height: 150,
                              alignment: Alignment.center,
                              child: Container(
                                width: 260,
                                padding: EdgeInsets.only(left: 110),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.results[index].title,
                                      style: kTextStyleMedium.copyWith(
                                          fontSize: 16.0),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      'Year: ${snapshot.data!.results[index].releaseDate.substring(0, 4)}',
                                      style: kTextStyleXSmall.copyWith(
                                          color: Colors.grey.shade600,
                                          letterSpacing: 1.0),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(children: [
                                      Text(
                                        '${snapshot.data!.results[index].voteAverage.toString()}',
                                        style: kTextStyleXSmall.copyWith(fontSize: 20.0)
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 16.0,
                                        color: Color(0xffBD4B4B),
                                      )
                                    ])
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: -30,
                          height: 220,
                          width: 120,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20.0,
                            ),
                            child: Container(
                              decoration: kOnlyBoxShadow,
                              child: Hero(
                                tag: Text('Hero'),
                                child: CachedNetworkImage(
                                  imageUrl: Constants.imageUrl +
                                      snapshot.data!.results[index].posterPath,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: Colors.black12,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.23,
                                    color: Theme.of(context).splashColor,
                                    child: Icon(
                                      Icons.error,
                                      color: Theme.of(context).iconTheme.color,
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10.0,
                          top: 30.0,
                          child: InkWell(
                            onTap: () {
                              movieProvider.addCount();
                              MovieModel movieModel = new MovieModel(
                                adult: snapshot.data!.results[index].adult,
                                genreIds:
                                    snapshot.data!.results[index].genreIds,
                                id: snapshot.data!.results[index].id,
                                originalTitle:
                                    snapshot.data!.results[index].originalTitle,
                                overview:
                                    snapshot.data!.results[index].overview,
                                popularity:
                                    snapshot.data!.results[index].popularity,
                                posterPath:
                                    snapshot.data!.results[index].posterPath,
                                releaseDate:
                                    snapshot.data!.results[index].releaseDate,
                                title: snapshot.data!.results[index].title,
                                video: snapshot.data!.results[index].video,
                                voteAverage:
                                    snapshot.data!.results[index].voteAverage,
                                voteCount:
                                    snapshot.data!.results[index].voteCount,
                              );
                              movieProvider.addMovie(movieModel);

                              setState(() {
                                if (isFav) {
                                  favMovies.remove(title);
                                } else {
                                  favMovies.add(title);
                                }
                              });
                            },
                            child: Icon(
                              isFav ? Icons.favorite : Icons.favorite_outline,
                              color: Colors.red,
                              size: 30.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ]);
              },
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text('${snapshot.error}');
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Color(0xffEEEEEE),
                )
              ],
            ),
          );
        });
  }
}
