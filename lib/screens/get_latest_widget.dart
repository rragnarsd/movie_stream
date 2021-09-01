import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/models/movie_result_model.dart';
import 'package:movie_stream/service/api_service.dart';

import '../constants.dart';
import 'movie_info_screen.dart';

class GetLatest extends StatefulWidget {
  const GetLatest({Key? key}) : super(key: key);

  @override
  _GetLatestState createState() => _GetLatestState();
}

class _GetLatestState extends State<GetLatest> {
  late Future<MovieResults> jsonData;

  @override
  void initState() {
    super.initState();
    jsonData = fetchTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          child: Text(
        'Get Latest',
        style: TextStyle(fontSize: 20.0),
      )),
      Container(
        height: 290.0,
        child: FutureBuilder<MovieResults>(
          future: jsonData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        width: 200.0,
                        child: Padding(
                            padding:
                                const EdgeInsets.only(right: 20.0, top: 20.0),
                            child: Stack(fit: StackFit.passthrough, children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade600,
                                        offset: const Offset(0, 0.4),
                                        blurRadius: 5.0,
                                        spreadRadius: 0.2,
                                      )
                                    ]
                                ),
                                child: ClipRRect(
                                  child: CachedNetworkImage(
                                    imageUrl: Constants.imageUrl +
                                        snapshot.data!.results[index].posterPath,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                ),
                              ),
                              Container(
                                  alignment: Alignment.bottomCenter,
                                  child: ClipRRect(
                                    child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        height: 35.0,
                                        color: Colors.black.withOpacity(0.7),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, right: 10.0,
                                          ),
                                          child: Text(
                                            snapshot.data!.results[index].title,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                        )),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                  ))
                            ])),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieInfoScreen(),
                          settings: RouteSettings(
                            arguments: snapshot.data!.results[index],
                          ),
                        ),
                      ),
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
          },
        ),
      ),
    ]);
  }
}
