import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/models/movie_result_model.dart';
import 'package:movie_stream/service/api_service.dart';

import '../constants.dart';
import '../style_constants.dart';
import '../screens/movie_info_screen.dart';

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
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, letterSpacing: 1.0, color: Color(0xfffEEEEEE)),
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
                                decoration: kBorderRadiusWithShadows,
                                child: ClipRRect(
                                  child: CachedNetworkImage(
                                    imageUrl: Constants.imageUrl +
                                        snapshot.data!.results[index].posterPath,
                                  ),
                                  borderRadius: kBorderRadiusOnly
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
                                            style: kTextStyleXSmall,
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                          ),
                                        )),
                                    borderRadius: kBorderRadiusOnly
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
                    color: Color(0xffEEEEEE),
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
