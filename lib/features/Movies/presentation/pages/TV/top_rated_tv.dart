import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/presentation/blocs/TV%20part/top%20rated/cubit/top_rated_cubit.dart';
import 'package:movie_app/features/Movies/presentation/pages/list_cards.dart';
import 'package:movie_app/features/Movies/presentation/widgets/horizntal_cards.dart';

class BuildTopRatedTv extends StatelessWidget {
  const BuildTopRatedTv({super.key});

  @override
  Widget build(BuildContext context) {
    List<MovieEntity> tv = [];
    return BlocConsumer<TopRatedTvCubit, TopRatedState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TopRatedTvsuccess ||
              state is TopRatedTvPagnationsuccess) {
            if (state is TopRatedTvsuccess) {
              tv = state.topRatedTv;
            } else if (state is TopRatedTvPagnationsuccess) {
              tv = state.topRatedTv;
            }

            tv.removeWhere((element) =>
                element.backdrop_path == null || element.posterTv == null);
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
                height: 130, child: Center(child: CircularProgressIndicator()));
          }
        });
  }
}

class BuildTopRatedTvPagnation extends StatelessWidget {
  const BuildTopRatedTvPagnation({super.key});

  @override
  Widget build(BuildContext context) {
    late List<MovieEntity> tv;
    return BlocConsumer<TopRatedTvCubit, TopRatedState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TopRatedTvsuccess ||
              state is TopRatedTvPagnationsuccess ||
              state is TopRatedTvLoding) {
            if (state is TopRatedTvsuccess) {
              tv = state.topRatedTv;
            } else if (state is TopRatedTvPagnationsuccess) {
              tv = state.topRatedTv;
              tv.addAll(state.topRatedTvpagnation);
            }
            tv.removeWhere((element) =>
                element.backdrop_path == null || element.posterTv == null);
            return ListCards(
              movie: tv,
              isMovie: false,
              categoryTitle: 'Top Rated',
            );
          }
          if (state is TopRatedTvFailure) {
            return Text(state.errMessage);
          } else {
            return const SizedBox(
                height: 130, child: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
