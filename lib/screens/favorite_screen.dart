import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/provider/provider.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    var movieProvider = Provider.of<MovieProvider>(context);
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: movieProvider.movieModel.length,
                itemBuilder: (context, index) {
                  final movie = movieProvider.movieModel[index].title;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      width: 200.0,
                      height: 120.0,
                      child: Dismissible(
                        direction: DismissDirection.endToStart,
                        key: Key(movie),
                        onDismissed: (direction) {
                          setState(() {
                            movieProvider.movieModel.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('$movie deleted from the list'),
                            ),
                          );
                        },
                        background: Container(
                            alignment: AlignmentDirectional.centerEnd,
                            color: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: Constants.imageUrl +
                                    movieProvider.movieModel[index].posterPath,
                                placeholder: (context, url) => Container(
                                  color: Colors.black12,
                                ),
                                errorWidget: (context, url, error) => Container(
                                  width: MediaQuery.of(context).size.width * 0.23,
                                  color: Theme.of(context).splashColor,
                                  child: Icon(
                                    Icons.error,
                                    color: Theme.of(context).iconTheme.color,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                  width: 200.0,
                                  child: Text(
                                    movieProvider.movieModel[index].title,
                                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ]),
        ),
      ),
    );
  }
}
