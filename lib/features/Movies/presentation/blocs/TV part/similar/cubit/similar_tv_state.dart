part of 'similar_tv_cubit.dart';

@immutable
sealed class SimilarTvState {}

final class SimilarTvInitial extends SimilarTvState {}

final class SimilarTvLoding extends SimilarTvState {}

final class SimilarTvFailure extends SimilarTvState {
  final String errMessage;
  SimilarTvFailure(this.errMessage);
}

final class SimilarTvsuccess extends SimilarTvState {
  final List<MovieEntity> similarTv;
  SimilarTvsuccess(this.similarTv);
}
