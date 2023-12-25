part of 'top_rated_cubit.dart';

@immutable
sealed class TopRatedState {
  final List<MovieEntity> topRatedMovies;
  final List<MovieEntity> topRatedMoviespage;

  const TopRatedState(
      {required this.topRatedMovies, required this.topRatedMoviespage});
}

final class TopRatedInitial extends TopRatedState {
  const TopRatedInitial(
      {required super.topRatedMovies, required super.topRatedMoviespage});
}

final class TopRatedLoding extends TopRatedState {
  const TopRatedLoding(
      {required super.topRatedMovies, required super.topRatedMoviespage});
}

final class TopRatedPaginationsuccess extends TopRatedState {
  const TopRatedPaginationsuccess(
      {required super.topRatedMovies, required super.topRatedMoviespage});
}

final class TopRatedFailure extends TopRatedState {
  final String errMessage;

  const TopRatedFailure(this.errMessage,
      {required super.topRatedMovies, required super.topRatedMoviespage});
}

final class TopRatedsuccess extends TopRatedState {
  const TopRatedsuccess(
      {required super.topRatedMovies, required super.topRatedMoviespage});
}
