part of 'top_rated_cubit.dart';

@immutable
sealed class TopRatedState {
  final List<MovieEntity> topRatedTv;
  final List<MovieEntity> topRatedTvpagnation;

  const TopRatedState(
      {required this.topRatedTv, required this.topRatedTvpagnation});
}

final class TopRatedInitial extends TopRatedState {
  const TopRatedInitial(
      {required super.topRatedTv, required super.topRatedTvpagnation});
}

final class TopRatedTvLoding extends TopRatedState {
  const TopRatedTvLoding(
      {required super.topRatedTv, required super.topRatedTvpagnation});
}

final class TopRatedTvFailure extends TopRatedState {
  final String errMessage;
  const TopRatedTvFailure(this.errMessage,
      {required super.topRatedTv, required super.topRatedTvpagnation});
}

final class TopRatedTvsuccess extends TopRatedState {
  const TopRatedTvsuccess(
      {required super.topRatedTv, required super.topRatedTvpagnation});
}

final class TopRatedTvPagnationsuccess extends TopRatedState {
  const TopRatedTvPagnationsuccess(
      {required super.topRatedTv, required super.topRatedTvpagnation});
}
