class MovieEntity {
  // ignore: non_constant_identifier_names
  final String? backdrop_path;
  final int? idMovie;
  final String? titleMovie;
  final String? releaseYear;
  final String? overviewMovie;
  final double? rate;
  final List<dynamic>? genres;
  final String? posterTv;

  MovieEntity(
      {required this.backdrop_path,
      required this.idMovie,
      required this.titleMovie,
      required this.releaseYear,
      required this.overviewMovie,
      required this.rate,
      required this.genres,
      required this.posterTv});

  // ignore: non_constant_identifier_names
}
