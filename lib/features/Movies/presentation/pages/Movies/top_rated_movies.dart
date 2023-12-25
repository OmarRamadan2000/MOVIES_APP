import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/presentation/blocs/Movie%20part/top%20rated/cubit/top_rated_cubit.dart';
import 'package:movie_app/features/Movies/presentation/pages/list_cards.dart';
import 'package:movie_app/features/Movies/presentation/widgets/horizntal_cards.dart';

class BuildTopRatedpagnation extends StatelessWidget {
  const BuildTopRatedpagnation({super.key});

  @override
  Widget build(BuildContext context) {
    late List<MovieEntity> movies;
    // ignore: avoid_types_as_parameter_names
    return BlocConsumer<TopRatedCubit, TopRatedState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TopRatedsuccess ||
              state is TopRatedPaginationsuccess ||
              state is TopRatedLoding) {
            if (state is TopRatedsuccess) {
              movies = state.topRatedMovies;
            } else if (state is TopRatedPaginationsuccess) {
              movies = state.topRatedMovies;
              movies.addAll(state.topRatedMoviespage);
            }
            movies.removeWhere((element) =>
                element.backdrop_path == null || element.posterTv == null);
            return ListCards(
              movie: movies,
              isMovie: true,
              categoryTitle: "Top Rated",
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

class BuildTopRatedWidget extends StatelessWidget {
  const BuildTopRatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_types_as_parameter_names
    return BlocBuilder<TopRatedCubit, TopRatedState>(builder: (context, state) {
      List<MovieEntity> movies = [];
      if (state is TopRatedsuccess || state is TopRatedPaginationsuccess) {
        if (state is TopRatedsuccess) {
          movies = state.topRatedMovies;
        } else if (state is TopRatedPaginationsuccess) {
          movies = state.topRatedMovies;
        }

        movies.removeWhere((element) =>
            element.backdrop_path == null || element.posterTv == null);
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
