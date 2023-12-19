// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/Movies/domain/entities/now_playing_entity.dart';
import 'package:movie_app/features/Movies/presentation/blocs/now%20playing/cubit/movie_cubit.dart';
import 'package:movie_app/features/Movies/presentation/blocs/popular/cubit/popular_cubit.dart';
import 'package:movie_app/features/Movies/presentation/blocs/top%20rated/cubit/top_rated_cubit.dart';
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
    return BlocBuilder<MovieCubit, MovieState>(builder: (context, state) {
      if (state is NowPlayingsuccess) {
        final List<NowPlayingEntity> movies = state.movies;
        return NowPlayingWidget(
          movie: movies,
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
        final List<NowPlayingEntity> movies = state.popularmovies;
        return HorizntalCards(
          movie: movies,
          cateName: "Popular",
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
        final List<NowPlayingEntity> movies = state.topRatedMovies;
        return HorizntalCards(
          movie: movies,
          cateName: "Top Rated",
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
