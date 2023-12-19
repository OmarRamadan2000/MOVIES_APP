class NowPlayingEntity {
  // ignore: non_constant_identifier_names
  final String? backdrop_path;
  final int idNowPlaying;
  final String titleNowPlaying;
  final String releaseYear;
  final String overviewMovie;
  final double rate;

  NowPlayingEntity(
      {required this.backdrop_path,
      required this.idNowPlaying,
      required this.titleNowPlaying,
      required this.releaseYear,
      required this.overviewMovie,
      required this.rate});

  // ignore: non_constant_identifier_names
}
