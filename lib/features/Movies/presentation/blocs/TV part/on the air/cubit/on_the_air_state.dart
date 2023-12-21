part of 'on_the_air_cubit.dart';

@immutable
sealed class OnTheAirState {}

final class OnTheAirInitial extends OnTheAirState {}

final class OnTheAirLoding extends OnTheAirState {}

final class OnTheAirFailure extends OnTheAirState {
  final String errMessage;
  OnTheAirFailure(this.errMessage);
}

final class OnTheAirsuccess extends OnTheAirState {
  final List<MovieEntity> onTheAirTv;
  OnTheAirsuccess(this.onTheAirTv);
}
