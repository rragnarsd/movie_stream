import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/models/movie_result_model.dart';
import 'package:movie_stream/screens/movie_category.dart';
import 'package:movie_stream/service/api_service.dart';

import '../movie_card_ui.dart';


class TopRatedMovies extends StatefulWidget {
  const TopRatedMovies({Key? key}) : super(key: key);

  @override
  _TopRatedMoviesState createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies> {
  late Future<MovieResults> jsonData;

  @override
  void initState() {
    super.initState();
    jsonData = fetchTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: MovieCardUi(
              jsonData: jsonData,
            ),
          ),
        ),
    );
  }
}