import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/models/movie_result_model.dart';
import 'package:movie_stream/service/api_service.dart';

import '../movie_card_ui.dart';


class ComingSoon extends StatefulWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  _ComingSoonState createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  late Future<MovieResults> jsonData;

  @override
  void initState() {
    super.initState();
    jsonData = MovieModel().fetchUpComingMovies();
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