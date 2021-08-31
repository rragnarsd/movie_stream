import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/screens/movie_info_screen.dart';

import 'constants.dart';
import 'models/movie_result_model.dart';

class MovieCardUi extends StatelessWidget {
  const MovieCardUi({
    Key? key,
    required this.jsonData,
  }) : super(key: key);

  final Future<MovieResults> jsonData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieResults>(
        future: jsonData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.results.length,
                itemBuilder: (context, index) {
                  return InkWell(
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
                    child: Row(children: [
                      Expanded(
                        child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.passthrough,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 40.0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                    color: Colors.grey.shade400,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade600,
                                        offset: const Offset(0, 1.0),
                                        blurRadius: 5.0,
                                        spreadRadius: 0.2,
                                      )
                                    ]),
                                width: 300,
                                height: 150,
                                alignment: Alignment.center,
                                child: Container(
                                  width: 260,
                                  padding: EdgeInsets.only(left: 110),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.results[index].title,
                                        style: TextStyle(fontSize: 18.0),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        'Year: ${snapshot.data!.results[index].releaseDate.substring(0, 4)}',
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(children: [
                                        Text(
                                          '${snapshot.data!.results[index].voteAverage.toString()}',
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                        SizedBox(width: 5.0,),
                                        Icon(Icons.star, size: 16.0,)
                                      ])
                                    ],
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
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade600,
                                      offset: const Offset(0, 0.4),
                                      blurRadius: 5.0,
                                      spreadRadius: 0.2,
                                    )
                                  ]),
                                  child: Hero(
                                    tag: Text('Hero'),
                                    child: CachedNetworkImage(
                                      imageUrl: Constants.imageUrl +
                                          snapshot
                                              .data!.results[index].posterPath,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Container(
                                        color: Colors.black12,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.23,
                                        color: Theme.of(context).splashColor,
                                        child: Icon(
                                          Icons.error,
                                          color:
                                              Theme.of(context).iconTheme.color,
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      )
                    ]),
                  );
                });
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text('${snapshot.error}');
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.black,
                )
              ],
            ),
          );
        });
  }
}
