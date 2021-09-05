import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/models/movie_model.dart';

class MovieProvider extends ChangeNotifier {
  int _count = 0;
  List<MovieModel> movieModel = [];

  void addCount() {
    _count++;
    notifyListeners();
  }

  void addMovie(MovieModel data) {
    movieModel.add(data);
    notifyListeners();
  }

  void removeMovie(MovieModel data) {
    movieModel.remove(data);
    notifyListeners();
  }

  int get count {
    return _count;
  }

  List<MovieModel> get movieList {
    return movieModel;
  }
}
