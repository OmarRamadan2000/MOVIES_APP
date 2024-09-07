import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/tv_usecase.dart';
import 'package:movie_app/features/Movies/presentation/blocs/TV%20part/on%20the%20air/cubit/on_the_air_cubit.dart';
import 'package:movie_app/features/Movies/presentation/blocs/TV%20part/similar/cubit/similar_tv_cubit.dart';
import 'package:movie_app/features/Movies/presentation/pages/TV/popular_tv.dart';
import 'package:movie_app/features/Movies/presentation/pages/TV/top_rated_tv.dart';
import 'package:movie_app/features/Movies/presentation/widgets/component.dart';
import 'package:movie_app/features/Movies/presentation/pages/Movies/now_playing.dart';
import 'package:movie_app/main.dart';

class HomeTv extends StatelessWidget {
  const HomeTv({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
          ],
        ),
      ),
    ));
  }
}

class BuildOnTheAir extends StatelessWidget {
  const BuildOnTheAir({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            OnTheAirCubit(getTV.get<TvUseCase>(param1: AppStrings.onTheAir))
              ..getonTheAir(),
        child: BlocConsumer<OnTheAirCubit, OnTheAirState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is OnTheAirsuccess) {
                final List<MovieEntity> tv = state.onTheAirTv;
                tv.removeWhere((element) =>
                    element.backdrop_path == null || element.posterTv == null);
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

class BuildSimilarTv extends StatelessWidget {
  const BuildSimilarTv(
      {super.key, required this.movieId, required this.isMovie});
  final int movieId;
  final bool isMovie;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            SimilarTvCubit(getTV.get<TvUseCase>(param1: "/tv/$movieId/similar"))
              ..getpoplarTv(),
        child: BlocConsumer<SimilarTvCubit, SimilarTvState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is SimilarTvsuccess) {
                final List<MovieEntity> tv = state.similarTv;
                tv.removeWhere((element) =>
                    element.backdrop_path == null || element.posterTv == null);
                return tv.isNotEmpty
                    ? GridImage(
                        movies: tv,
                        isMovie: isMovie,
                      )
                    : const SizedBox();
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
