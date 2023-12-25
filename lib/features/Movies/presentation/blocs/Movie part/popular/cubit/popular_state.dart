part of 'popular_cubit.dart';

@immutable
sealed class PopularState {
  final List<MovieEntity> popularmoviespagnation;
  final List<MovieEntity> popularmovies;

  const PopularState(
      {required this.popularmoviespagnation, required this.popularmovies});
}

final class PopularInitial extends PopularState {
  const PopularInitial(
      {required super.popularmoviespagnation, required super.popularmovies});
}

final class PopularLoding extends PopularState {
  const PopularLoding(
      {required super.popularmoviespagnation, required super.popularmovies});
}

final class PopularFailure extends PopularState {
  final String errMessage;

  const PopularFailure(this.errMessage,
      {required super.popularmoviespagnation, required super.popularmovies});
}

final class Popularsuccesspagnation extends PopularState {
  const Popularsuccesspagnation(
      {required super.popularmoviespagnation, required super.popularmovies});
}

final class Popularsuccess extends PopularState {
  const Popularsuccess(
      {required super.popularmoviespagnation, required super.popularmovies});
}
