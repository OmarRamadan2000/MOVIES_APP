import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';

class TvModel extends MovieEntity {
  bool? adult;
  String? backdropPath;
  List<dynamic>? genreIds;
  int? id;
  List<dynamic>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  String? firstAirDate;
  String? name;
  double? voteAverage;
  int? voteCount;

  TvModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
  }) : super(
            backdrop_path: backdropPath,
            idMovie: id,
            titleMovie: name,
            releaseYear: firstAirDate,
            overviewMovie: overview,
            rate: voteAverage,
            genres: genreIds,
            posterTv: posterPath);

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        adult: json['adult'] as bool?,
        backdropPath: json['backdrop_path'] as String?,
        genreIds: json['genre_ids'] as List<dynamic>?,
        id: json['id'] as int?,
        originCountry: json['origin_country'] as List<dynamic>?,
        originalLanguage: json['original_language'] as String?,
        originalName: json['original_name'] as String?,
        overview: json['overview'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        posterPath: json['poster_path'] as String?,
        firstAirDate: json['first_air_date'] as String?,
        name: json['name'] as String?,
        voteAverage: (json['vote_average'] as num?)?.toDouble(),
        voteCount: json['vote_count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': genreIds,
        'id': id,
        'origin_country': originCountry,
        'original_language': originalLanguage,
        'original_name': originalName,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'first_air_date': firstAirDate,
        'name': name,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}
