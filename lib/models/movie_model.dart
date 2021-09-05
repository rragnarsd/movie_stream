import 'package:movie_stream/entities/movie_entity.dart';

class MovieModel extends MovieEntity {

  final bool adult;
 /* final String backdropPath;*/
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  late final bool isFavorite;

  MovieModel({
    required this.adult,
 /*   required this.backdropPath,*/
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
   /* required this.isFavorite*/
  }) : super(
    id: id,
    title: title,
/*    backdropPath: backdropPath,*/
    posterPath: posterPath,
    releaseDate: releaseDate,
    voteAverage: voteCount,
    overview: overview
  );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        adult: json["adult"],
/*        backdropPath: json["backdrop_path"],*/
        genreIds: json['genre_ids'].cast<int>(),
        id: json["id"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble() ?? 0.0,
        posterPath: json["poster_path"],
        releaseDate: json['release_date'],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
        voteCount: json["vote_count"],
        /*isFavorite: false*/);
  }

  Map<String, dynamic> toJson()  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video'] = this.video;
    data['vote_count'] = this.voteCount;
    data['vote_average'] = this.voteAverage;
    data['title'] = this.title;
    data['release_date'] = this.releaseDate;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
/*    data['backdrop_path'] = this.backdropPath;*/
    data['adult'] = this.adult;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['popularity'] = this.popularity;
    return data;
  }
}

