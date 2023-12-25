import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/presentation/blocs/TV%20part/popular%20tv/cubit/popular_tv_cubit.dart';
import 'package:movie_app/features/Movies/presentation/pages/list_cards.dart';
import 'package:movie_app/features/Movies/presentation/widgets/horizntal_cards.dart';

class BuildPopularTv extends StatelessWidget {
  const BuildPopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    List<MovieEntity> tv = [];
    return BlocConsumer<PopularTvCubit, PopularTvState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PopularTvsuccess || state is PopularTvPagnationsuccess) {
            if (state is PopularTvsuccess) {
              tv = state.popularTv;
            } else if (state is PopularTvPagnationsuccess) {
              tv = state.popularTv;
            }

            tv.removeWhere((element) =>
                element.backdrop_path == null || element.posterTv == null);
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
                height: 130, child: Center(child: CircularProgressIndicator()));
          }
        });
  }
}

class BuildPopularTvPagnation extends StatelessWidget {
  const BuildPopularTvPagnation({super.key});

  @override
  Widget build(BuildContext context) {
    late List<MovieEntity> tv;
    return BlocBuilder<PopularTvCubit, PopularTvState>(
        builder: (context, state) {
      if (state is PopularTvsuccess ||
          state is PopularTvPagnationsuccess ||
          state is PopularTvLoding) {
        if (state is PopularTvsuccess) {
          tv = state.popularTv;
        } else if (state is PopularTvPagnationsuccess) {
          tv = state.popularTv;
          tv.addAll(state.popularTvPagnation);
        }
        tv.removeWhere((element) =>
            element.backdrop_path == null || element.posterTv == null);
        return ListCards(
          movie: tv,
          isMovie: false,
          categoryTitle: 'Popular',
        );
      }
      if (state is PopularTvFailure) {
        return Text(state.errMessage);
      } else {
        return const SizedBox(
            height: 130, child: Center(child: CircularProgressIndicator()));
      }
    });
  }
}
