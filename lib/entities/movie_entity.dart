import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String posterPath;
  final String title;
  final num voteAverage;
  final String releaseDate;
  final String overview;

  MovieEntity(
      {required this.id,
      required this.posterPath,
      required this.title,
      required this.voteAverage,
      required this.releaseDate,
      required this.overview,
      });

  @override
  List<Object> get props => [id, title];

}
