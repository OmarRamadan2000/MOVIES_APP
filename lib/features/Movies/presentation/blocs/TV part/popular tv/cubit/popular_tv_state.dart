part of 'popular_tv_cubit.dart';

@immutable
sealed class PopularTvState {
  final List<MovieEntity> popularTv;
  final List<MovieEntity> popularTvPagnation;

  PopularTvState({required this.popularTv, required this.popularTvPagnation});
}

final class PopularTvInitial extends PopularTvState {
  PopularTvInitial(
      {required super.popularTv, required super.popularTvPagnation});
}

final class PopularTvLoding extends PopularTvState {
  PopularTvLoding(
      {required super.popularTv, required super.popularTvPagnation});
}

final class PopularTvFailure extends PopularTvState {
  final String errMessage;
  PopularTvFailure(this.errMessage,
      {required super.popularTv, required super.popularTvPagnation});
}

final class PopularTvsuccess extends PopularTvState {
  PopularTvsuccess(
      {required super.popularTv, required super.popularTvPagnation});
}

final class PopularTvPagnationsuccess extends PopularTvState {
  PopularTvPagnationsuccess(
      {required super.popularTv, required super.popularTvPagnation});
}
