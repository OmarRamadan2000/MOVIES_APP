import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/api/api_service.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/features/Movies/data/data_sources/now_playing_data_source.dart';
import 'package:movie_app/features/Movies/data/repositories_impl/now_palying_repo_impl.dart';
import 'package:movie_app/features/Movies/domain/entities/now_playing_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/now_play_usecase.dart';
import 'package:movie_app/features/Movies/presentation/blocs/cubit/now_playing_cubit.dart';

//import 'package:shimmer/shimmer.dart';
class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext) => NowPlayingCubit(NowPlayingUseCase(
          NowPlayingRepoImpl(
              NowPlayingRemoteDataSourceImpl(ApiService(Dio())))))
        ..getNowPlaying(),
      child: BlocConsumer<NowPlayingCubit, NowPlayingState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is NowPlayingsuccess) {
            final List<NowPlayingEntity> movie = state.movies;
            return Expanded(
                flex: 1,
                child: CarouselSlider(
                  items: movie
                      .map(
                        (e) => Stack(
                          children: [
                            CachedNetworkImage(
                              fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.height * .5,
                              imageUrl: AppStrings.image + e.backdrop_path,
                              placeholder: (context, url) {
                                return const Center(
                                    child: SizedBox(
                                  child: CircularProgressIndicator(),
                                ));
                              },
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: const Alignment(0, .55),
                                      colors: [
                                    AppColors.primary.withOpacity(.8),
                                    AppColors.primary.withOpacity(.0),
                                  ])),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: Colors.red,
                                          radius: 4),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text("NOW PLAYING",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 12)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    e.titleNowPlaying,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ]),
                          ],
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                    height: MediaQuery.of(context).size.height * .5,
                  ),
                ));
          }
          if (state is NowPlayingFailure) {
            print(state.errMessage);
          }
          if (state is NowPlayingLoding) {
            print("load");
          }
          return Container();
        },
      ),
    );
  }
}
