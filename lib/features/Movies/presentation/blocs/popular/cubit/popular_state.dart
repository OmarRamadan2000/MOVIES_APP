part of 'popular_cubit.dart';

@immutable
sealed class PopularState {}

final class PopularInitial extends PopularState {}

final class PopularLoding extends PopularState {}

final class PopularFailure extends PopularState {
  final String errMessage;

  PopularFailure(this.errMessage);
}

final class Popularsuccess extends PopularState {
  final List<NowPlayingEntity> popularmovies;

  Popularsuccess(this.popularmovies);
}
