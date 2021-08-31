import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/models/movie_result_model.dart';
import 'package:movie_stream/screens/profile_screen.dart';
import 'package:movie_stream/service/api_service.dart';

import '../constants.dart';

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
              height: 300.0,
              child: FutureBuilder<MovieResults>(
                future: jsonData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 20.0, top: 20.0),
                              child: CachedNetworkImage(
                                imageUrl: Constants.imageUrl +
                                    snapshot.data!.results[index].posterPath,
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
