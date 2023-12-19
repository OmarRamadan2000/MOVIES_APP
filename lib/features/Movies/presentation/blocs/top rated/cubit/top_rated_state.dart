part of 'top_rated_cubit.dart';

@immutable
sealed class TopRatedState {}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedLoding extends TopRatedState {}

final class TopRatedFailure extends TopRatedState {
  final String errMessage;

  TopRatedFailure(this.errMessage);
}

final class TopRatedsuccess extends TopRatedState {
  final List<NowPlayingEntity> topRatedMovies;

  TopRatedsuccess(this.topRatedMovies);
}
