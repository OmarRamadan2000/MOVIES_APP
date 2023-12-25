import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/presentation/blocs/Movie%20part/popular/cubit/popular_cubit.dart';
import 'package:movie_app/features/Movies/presentation/pages/list_cards.dart';
import 'package:movie_app/features/Movies/presentation/widgets/horizntal_cards.dart';

class BuildPopularWidget extends StatelessWidget {
  const BuildPopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_types_as_parameter_names
    return BlocBuilder<PopularCubit, PopularState>(builder: (context, state) {
      List<MovieEntity> movies = [];
      if (state is Popularsuccess || state is Popularsuccesspagnation) {
        if (state is Popularsuccess) {
          movies = state.popularmovies;
        } else if (state is Popularsuccesspagnation) {
          movies = state.popularmovies;
        }

        movies.removeWhere((element) =>
            element.backdrop_path == null || element.posterTv == null);
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

class BuildPopularPagnation extends StatelessWidget {
  const BuildPopularPagnation({super.key});

  @override
  Widget build(BuildContext context) {
    late List<MovieEntity> movies;

    return BlocBuilder<PopularCubit, PopularState>(builder: (context, state) {
      if (state is Popularsuccess ||
          state is Popularsuccesspagnation ||
          state is PopularLoding) {
        if (state is Popularsuccess) {
          movies = state.popularmovies;
        } else if (state is Popularsuccesspagnation) {
          movies = state.popularmovies;
          movies.addAll(state.popularmoviespagnation);
        }
        movies.removeWhere((element) =>
            element.backdrop_path == null || element.posterTv == null);
        return ListCards(
          movie: movies,
          isMovie: true,
          categoryTitle: "Popular",
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
