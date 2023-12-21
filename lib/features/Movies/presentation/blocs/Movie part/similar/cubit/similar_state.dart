part of 'similar_cubit.dart';

@immutable
sealed class SimilarState {}

final class SimilarInitial extends SimilarState {}

final class SimilarLoding extends SimilarState {}

final class SimilarFailure extends SimilarState {
  final String errMessage;

  SimilarFailure(this.errMessage);
}

final class Similarsuccess extends SimilarState {
  final List<MovieEntity> similarmovies;

  Similarsuccess(this.similarmovies);
}
