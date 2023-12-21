// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/api/api_service.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/Movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/features/Movies/data/repositories_impl/movie_repo_impl.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/movie_usecase.dart';
import 'package:movie_app/features/Movies/presentation/blocs/Movie%20part/now%20playing/cubit/movie_cubit.dart';
import 'package:movie_app/features/Movies/presentation/blocs/Movie%20part/popular/cubit/popular_cubit.dart';
import 'package:movie_app/features/Movies/presentation/blocs/Movie%20part/similar/cubit/similar_cubit.dart';
import 'package:movie_app/features/Movies/presentation/blocs/Movie%20part/top%20rated/cubit/top_rated_cubit.dart';
import 'package:movie_app/features/Movies/presentation/widgets/component.dart';
import 'package:movie_app/features/Movies/presentation/widgets/horizntal_cards.dart';
import 'package:movie_app/features/Movies/presentation/widgets/now_playing.dart';

class HomeMovie extends StatelessWidget {
  const HomeMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: AppColors.secondary,
          child: const Column(
            children: [
              BuildNowPlayingWidget(),
              SizedBox(
                height: 20,
              ),
              BuildPopularWidget(),
              SizedBox(
                height: 15,
              ),
              BuildTopRatedWidget(),
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

class BuildNowPlayingWidget extends StatelessWidget {
  const BuildNowPlayingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_types_as_parameter_names
    return BlocBuilder<NowPlayingCubit, MovieState>(builder: (context, state) {
      if (state is NowPlayingsuccess) {
        final List<MovieEntity> movies = state.movies;
        movies.removeWhere((element) => element.backdrop_path == null);
        return NowPlayingWidget(
          live: 'NOW PLAYING',
          movie: movies,
          isMovie: true,
        );
      }
      if (state is NowPlayingFailure) {
        return Text(state.errMessage);
      } else {
        return SizedBox(
            height: MediaQuery.of(context).size.height * .5,
            child: const Center(child: CircularProgressIndicator()));
      }
    });
  }
}

class BuildPopularWidget extends StatelessWidget {
  const BuildPopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_types_as_parameter_names
    return BlocBuilder<PopularCubit, PopularState>(builder: (context, state) {
      if (state is Popularsuccess) {
        final List<MovieEntity> movies = state.popularmovies;
        movies.removeWhere((element) => element.backdrop_path == null);
        return HorizntalCards(
          movie: movies,
          cateName: "Popular",
          isMovie: true,
        );
      }
      if (state is PopularFailure) {
        return Text(state.errMessage);
      } else {
        return const SizedBox(
            height: 130, child: Center(child: CircularProgressIndicator()));
      }
    });
  }
}

class BuildTopRatedWidget extends StatelessWidget {
  const BuildTopRatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_types_as_parameter_names
    return BlocBuilder<TopRatedCubit, TopRatedState>(builder: (context, state) {
      if (state is TopRatedsuccess) {
        final List<MovieEntity> movies = state.topRatedMovies;
        movies.removeWhere((element) => element.backdrop_path == null);
        return HorizntalCards(
          movie: movies,
          cateName: "Top Rated",
          isMovie: true,
        );
      }
      if (state is TopRatedFailure) {
        return Text(state.errMessage);
      } else {
        return const SizedBox(
            height: 130, child: Center(child: CircularProgressIndicator()));
      }
    });
  }
}

class BulidSimilarMovie extends StatelessWidget {
  const BulidSimilarMovie(
      {super.key, required this.movieId, required this.isMovie});
  final int movieId;
  final bool isMovie;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarCubit(
        MovieUseCase(
          MovieRepoImpl(
            MovieRemoteDataSourceImpl(
                ApiService(Dio()), "/movie/$movieId/similar"),
          ),
        ),
      )..getSimilar(),
      child: BlocConsumer<SimilarCubit, SimilarState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is Similarsuccess) {
            final List<MovieEntity> movies = state.similarmovies;
            movies.removeWhere((element) => element.posterTv == null);
            return GridImage(
              movies: movies,
              isMovie: isMovie,
            );
          }
          if (state is SimilarFailure) {
            return Text(state.errMessage);
          } else {
            return const SizedBox(
                height: 130, child: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
