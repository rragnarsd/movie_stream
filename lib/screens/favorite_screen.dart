import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movieProvider = Provider.of<MovieProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: movieProvider.movieModel.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(movieProvider.movieModel[index].title),
                );
              })
        ]),
      ),
    );
  }
}
