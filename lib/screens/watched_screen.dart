import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/models/movie_result_model.dart';
import 'package:movie_stream/provider/provider.dart';
import 'package:movie_stream/service/api_service.dart';
import 'package:provider/provider.dart';

import '../service/constants.dart';
import '../style_constants.dart';

class WatchedScreen extends StatefulWidget {
  const WatchedScreen({Key? key}) : super(key: key);

  @override
  _WatchedScreenState createState() => _WatchedScreenState();
}

class _WatchedScreenState extends State<WatchedScreen> {
  late Future<MovieResults> jsonData;

  @override
  void initState() {
    super.initState();
    jsonData = fetchWatched();
  }

  @override
  Widget build(BuildContext context) {
    var movieProvider = Provider.of<MovieProvider>(context);
    return Scaffold(
        appBar: buildAppBar(movieProvider),
        body: FutureBuilder<MovieResults>(
          future: jsonData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0,
                ),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.results.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2 / 3,
                    ),
                    itemBuilder: (context, index) {
                      final movie = snapshot.data!.results[index].title;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 5.0,
                        ),
                        child: Dismissible(
                          direction: DismissDirection.endToStart,
                          key: Key(movie),
                          onDismissed: (direction) {
                            setState(() {
                              snapshot.data!.results.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('$movie deleted from the list'),
                              ),
                            );
                          },
                          background: Container(
                            alignment: AlignmentDirectional.centerEnd,
                            color: Color(0xffBD4B4B),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: Container(
                            decoration: kOnlyBoxShadow,
                            child: ClipRRect(
                              borderRadius: kBorderRadiusOnly,
                              child: CachedNetworkImage(
                                imageUrl: Constants.imageUrl +
                                    snapshot.data!.results[index].posterPath,
                                placeholder: (context, url) => Container(
                                  color: Colors.black12,
                                ),
                                errorWidget: (context, url, error) => Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
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
                      );
                    }),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text('${snapshot.error}');
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator(color: Color(0xffEEEEEE))],
              ),
            );
          },
        ));
  }

  AppBar buildAppBar(MovieProvider movieProvider) {
    return AppBar(
        title: Text(
          'History',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                movieProvider.movieModel.clear();
              });
            },
            icon: Icon(Icons.delete),
          )
        ],
      );
  }
}
