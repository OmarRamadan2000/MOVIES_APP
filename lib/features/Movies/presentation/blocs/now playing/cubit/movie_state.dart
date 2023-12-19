part of 'movie_cubit.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class NowPlayingLoding extends MovieState {}

final class NowPlayingFailure extends MovieState {
  final String errMessage;

  NowPlayingFailure(this.errMessage);
}

final class NowPlayingsuccess extends MovieState {
  final List<NowPlayingEntity> movies;

  NowPlayingsuccess(this.movies);
}
