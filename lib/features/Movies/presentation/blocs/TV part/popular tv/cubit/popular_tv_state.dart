part of 'popular_tv_cubit.dart';

@immutable
sealed class PopularTvState {}

final class PopularTvInitial extends PopularTvState {}

final class PopularTvLoding extends PopularTvState {}

final class PopularTvFailure extends PopularTvState {
  final String errMessage;
  PopularTvFailure(this.errMessage);
}

final class PopularTvsuccess extends PopularTvState {
  final List<MovieEntity> popularTv;
  PopularTvsuccess(this.popularTv);
}
