import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/api/api_service.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/features/Movies/data/data_sources/tv_remote_data_source.dart';
import 'package:movie_app/features/Movies/data/repositories_impl/tv_repoImpl.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/tv_usecase.dart';
import 'package:movie_app/features/Movies/presentation/blocs/TV%20part/on%20the%20air/cubit/on_the_air_cubit.dart';
import 'package:movie_app/features/Movies/presentation/blocs/TV%20part/popular%20tv/cubit/popular_tv_cubit.dart';
import 'package:movie_app/features/Movies/presentation/blocs/TV%20part/similar/cubit/similar_tv_cubit.dart';
import 'package:movie_app/features/Movies/presentation/blocs/TV%20part/top%20rated/cubit/top_rated_cubit.dart';
import 'package:movie_app/features/Movies/presentation/widgets/component.dart';
import 'package:movie_app/features/Movies/presentation/widgets/horizntal_cards.dart';
import 'package:movie_app/features/Movies/presentation/widgets/now_playing.dart';

class HomeTv extends StatelessWidget {
  const HomeTv({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: AppColors.secondary,
          child: const Column(
            children: [
              BuildOnTheAir(),
              SizedBox(
                height: 20,
              ),
              BuildPopularTv(),
              SizedBox(
                height: 15,
              ),
              BuildTopRatedTv(),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildOnTheAir extends StatelessWidget {
  const BuildOnTheAir({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OnTheAirCubit(TvUseCase(TvRepoImpl(
            TvRemoteDataSourceImpl(ApiService(Dio()), AppStrings.onTheAir))))
          ..getonTheAir(),
        child: BlocConsumer<OnTheAirCubit, OnTheAirState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is OnTheAirsuccess) {
                final List<MovieEntity> tv = state.onTheAirTv;
                tv.removeWhere((element) => element.backdrop_path == null);
                return NowPlayingWidget(
                  movie: tv,
                  live: "ON THE AIR",
                  isMovie: false,
                );
              }
              if (state is OnTheAirFailure) {
                return Text(state.errMessage);
              } else {
                return const SizedBox(
                    height: 130,
                    child: Center(child: CircularProgressIndicator()));
              }
            }));
  }
}

class BuildPopularTv extends StatelessWidget {
  const BuildPopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PopularTvCubit(TvUseCase(TvRepoImpl(
            TvRemoteDataSourceImpl(ApiService(Dio()), AppStrings.popularTv))))
          ..getpoplarTv(),
        child: BlocConsumer<PopularTvCubit, PopularTvState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is PopularTvsuccess) {
                final List<MovieEntity> tv = state.popularTv;
                tv.removeWhere((element) => element.backdrop_path == null);
                return HorizntalCards(
                  movie: tv,
                  cateName: 'Popular',
                  isMovie: false,
                );
              }
              if (state is PopularTvFailure) {
                return Text(state.errMessage);
              } else {
                return const SizedBox(
                    height: 130,
                    child: Center(child: CircularProgressIndicator()));
              }
            }));
  }
}

class BuildTopRatedTv extends StatelessWidget {
  const BuildTopRatedTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TopRatedCubit(TvUseCase(TvRepoImpl(
            TvRemoteDataSourceImpl(ApiService(Dio()), AppStrings.topRatedTv))))
          ..getTopRatedTv(),
        child: BlocConsumer<TopRatedCubit, TopRatedState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is TopRatedTvsuccess) {
                final List<MovieEntity> tv = state.topRatedTv;
                tv.removeWhere((element) => element.backdrop_path == null);
                return HorizntalCards(
                  movie: tv,
                  cateName: 'Top Rated',
                  isMovie: false,
                );
              }
              if (state is TopRatedTvFailure) {
                return Text(state.errMessage);
              } else {
                return const SizedBox(
                    height: 130,
                    child: Center(child: CircularProgressIndicator()));
              }
            }));
  }
}

class BuildSimilarTv extends StatelessWidget {
  const BuildSimilarTv(
      {super.key, required this.movieId, required this.isMovie});
  final int movieId;
  final bool isMovie;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SimilarTvCubit(TvUseCase(TvRepoImpl(
            TvRemoteDataSourceImpl(ApiService(Dio()), "/tv/$movieId/similar"))))
          ..getpoplarTv(),
        child: BlocConsumer<SimilarTvCubit, SimilarTvState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is SimilarTvsuccess) {
                final List<MovieEntity> tv = state.similarTv;
                tv.removeWhere((element) => element.backdrop_path == null);
                return GridImage(
                  movies: tv,
                  isMovie: isMovie,
                );
              }
              if (state is SimilarTvFailure) {
                return Text(state.errMessage);
              } else {
                return const SizedBox(
                    height: 130,
                    child: Center(child: CircularProgressIndicator()));
              }
            }));
  }
}
