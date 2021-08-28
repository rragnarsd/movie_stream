import 'movie_model.dart';

class MovieResults {
  late List<MovieModel> results;

  MovieResults({required this.results});

  MovieResults.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <MovieModel>[];
      json['results'].forEach((v) {
        results.add(MovieModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.results.map((v) => v.toJson()).toList();
    return data;
  }
}

