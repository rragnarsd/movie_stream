import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/provider/provider.dart';
import 'package:provider/provider.dart';

import '../service/constants.dart';
import '../style_constants.dart';

class FavoriteScreen extends StatefulWidget {

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    return Scaffold(
        appBar: buildAppBar(movieProvider),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: movieProvider.movieModel.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, index) {
                final movie = movieProvider.movieModel[index].title;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 5.0,
                  ),
                  child: Dismissible(
                    direction: DismissDirection.endToStart,
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      movieProvider.removeMovie(movieProvider.movieModel[index]);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$movie deleted from the list'),
                          duration: Duration(milliseconds: 1200),
                        ),
                      );
                    },
                    background: FavoriteDelete(),
                    child: Container(
                      decoration: kOnlyBoxShadow,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                        child: CachedNetworkImage(
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
                      ),
                    ),
                  ),
                );
              }),
        ),
    );
  }

  AppBar buildAppBar(MovieProvider movieProvider) {
    return AppBar(
        title: Text(
          'Favorites',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () => movieProvider.clearAllFavorites(),
            icon: Icon(Icons.delete),
          )
        ],
      );
  }
}

class FavoriteDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerEnd,
      color: Color(0xffBD4B4B),
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }
}
