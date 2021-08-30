import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movie_stream/models/movie_result_model.dart';

import '../constants.dart';

Future<MovieResults> fetchTopRatedMovies() async {
  final response = await http.get(Uri.parse(Constants.baseUrl +
      Constants.topRatedMovies +
      dotenv.get('API_PARAM') +
      dotenv.get('API_KEY')));

  if (response.statusCode == 200) {
    return MovieResults.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

Future<MovieResults> fetchUpComingMovies() async {
  final response = await http.get(Uri.parse(Constants.baseUrl +
      Constants.upcomingMovies +
      dotenv.get('API_PARAM') +
      dotenv.get('API_KEY')));

  if (response.statusCode == 200) {
    return MovieResults.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

Future<MovieResults> fetchPopularMovies() async {
  final response = await http.get(Uri.parse(Constants.baseUrl +
      Constants.popularMovies +
      dotenv.get('API_PARAM') +
      dotenv.get('API_KEY')));

  if (response.statusCode == 200) {
    return MovieResults.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

Future<MovieResults> searchMovies() async {
  final response = await http.get(Uri.parse(Constants.baseUrl +
      Constants.searchMovies +
      dotenv.get('API_PARAM') +
      dotenv.get('API_KEY')));

  if (response.statusCode == 200) {
    return MovieResults.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
