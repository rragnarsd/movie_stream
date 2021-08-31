import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/models/movie_result_model.dart';
import 'package:movie_stream/service/api_service.dart';

import '../constants.dart';
import 'movie_info_screen.dart';

class GetLatestWidget extends StatefulWidget {
  const GetLatestWidget({Key? key}) : super(key: key);

  @override
  _GetLatestWidgetState createState() => _GetLatestWidgetState();
}

class _GetLatestWidgetState extends State<GetLatestWidget> {
  late Future<MovieResults> jsonData;

  @override
  void initState() {
    super.initState();
    jsonData = fetchNowPlaying();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        child: Text(
          'Now Playing',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      Container(
        height: 250.0,
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
                        width: 350,
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
                                  fit: BoxFit.fitWidth,
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
                                    height: 45.0,
                                    color: Colors.black.withOpacity(0.7),
                                    child: Text(
                                      snapshot.data!.results[index].title,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    )),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                ),
                              ),
                            )
                          ]),
                        ),
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
