import 'package:movie_app/features/Movies/domain/entities/now_playing_entity.dart';

class MovieModel extends NowPlayingEntity {
  bool? adult;
  String? backdropPath;
  List<dynamic>? genreIds;
  int id;
  String? originalLanguage;
  String? originalTitle;
  String overview;
  double? popularity;
  String? posterPath;
  String releaseDate;
  String title;
  bool? video;
  double voteAverage;
  int? voteCount;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id = 0,
    this.originalLanguage,
    this.originalTitle,
    this.overview = "Not found overview",
    this.popularity,
    this.posterPath,
    this.releaseDate = 'Not found release Date',
    this.title = "",
    this.video,
    this.voteAverage = 0.0,
    this.voteCount,
  }) : super(
            backdrop_path: backdropPath,
            idNowPlaying: id,
            titleNowPlaying: title,
            overviewMovie: overview,
            rate: voteAverage,
            releaseYear: releaseDate);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: json['genre_ids'] as List<dynamic>?,
      id: json['id'] as int,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String,
      title: json['title'] as String,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': genreIds,
        'id': id,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}
