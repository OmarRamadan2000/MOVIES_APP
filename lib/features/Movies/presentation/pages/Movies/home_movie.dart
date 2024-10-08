import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/movie_usecase.dart';
import 'package:movie_app/features/Movies/presentation/blocs/Movie%20part/now%20playing/cubit/movie_cubit.dart';
import 'package:movie_app/features/Movies/presentation/blocs/Movie%20part/similar/cubit/similar_cubit.dart';
import 'package:movie_app/features/Movies/presentation/pages/Movies/popular_movies.dart';
import 'package:movie_app/features/Movies/presentation/pages/Movies/top_rated_movies.dart';
import 'package:movie_app/features/Movies/presentation/widgets/component.dart';
import 'package:movie_app/features/Movies/presentation/pages/Movies/now_playing.dart';
import 'package:movie_app/main.dart';

class HomeMovie extends StatelessWidget {
  const HomeMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
    ));
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
        movies.removeWhere((element) =>
            element.backdrop_path == null || element.posterTv == null);
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

class BulidSimilarMovie extends StatelessWidget {
  const BulidSimilarMovie(
      {super.key, required this.movieId, required this.isMovie});
  final int movieId;
  final bool isMovie;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarCubit(
          getMovie.get<MovieUseCase>(param1: "/movie/$movieId/similar"))
        ..getSimilar(),
      child: BlocConsumer<SimilarCubit, SimilarState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is Similarsuccess) {
            final List<MovieEntity> movies = state.similarmovies;
            movies.removeWhere((element) =>
                element.posterTv == null || element.posterTv == null);
            return movies.isNotEmpty
                ? GridImage(
                    movies: movies,
                    isMovie: isMovie,
                  )
                : const SizedBox();
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
