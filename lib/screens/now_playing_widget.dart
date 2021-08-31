import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/models/movie_result_model.dart';
import 'package:movie_stream/service/api_service.dart';

import '../constants.dart';

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
                    return Container(
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0, top: 20.0),
                        child: Stack(fit: StackFit.passthrough, children: [
                          CachedNetworkImage(
                            imageUrl: Constants.imageUrl +
                                snapshot.data!.results[index].posterPath,
                            fit: BoxFit.fitWidth,
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                height: 40.0,
                                color: Colors.black.withOpacity(0.7),
                                child: Text(
                                  snapshot.data!.results[index].title,
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white,
                                  ),
                                )),
                          )
                        ]),
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
