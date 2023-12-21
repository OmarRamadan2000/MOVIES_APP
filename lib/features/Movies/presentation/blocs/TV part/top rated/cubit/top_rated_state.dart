part of 'top_rated_cubit.dart';

@immutable
sealed class TopRatedState {}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedTvLoding extends TopRatedState {}

final class TopRatedTvFailure extends TopRatedState {
  final String errMessage;
  TopRatedTvFailure(this.errMessage);
}

final class TopRatedTvsuccess extends TopRatedState {
  final List<MovieEntity> topRatedTv;
  TopRatedTvsuccess(this.topRatedTv);
}
