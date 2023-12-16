part of 'now_playing_cubit.dart';

@immutable
sealed class NowPlayingState {}

final class NowPlayingInitial extends NowPlayingState {}

final class NowPlayingLoding extends NowPlayingState {}

final class NowPlayingFailure extends NowPlayingState {
  final String errMessage;

  NowPlayingFailure(this.errMessage);
}

final class NowPlayingsuccess extends NowPlayingState {
  final List<NowPlayingEntity> movies;

  NowPlayingsuccess(this.movies);
}
