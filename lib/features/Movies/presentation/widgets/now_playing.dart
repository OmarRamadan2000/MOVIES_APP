import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/features/Movies/domain/entities/now_playing_entity.dart';
import 'package:shimmer/shimmer.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({super.key, required this.movie});
  final List<NowPlayingEntity> movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .5,
        child: CarouselSlider(
          items: movie
              .map(
                (e) => Stack(
                  children: [
                    CachedNetworkImage(
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * .5,
                      imageUrl: e.backdrop_path == null
                          ? ""
                          : AppStrings.image + e.backdrop_path!,
                      placeholder: (context, url) {
                        return Center(
                            child: SizedBox(
                          child: Center(
                            child: Shimmer.fromColors(
                                baseColor: Colors.grey,
                                highlightColor: Colors.grey,
                                child: const Card(
                                  color: Colors.white,
                                )),
                          ),
                        ));
                      },
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: const Alignment(0, .55),
                              colors: [
                            AppColors.secondary.withOpacity(.8),
                            AppColors.secondary.withOpacity(.0),
                          ])),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  backgroundColor: AppColors.red, radius: 4),
                              const SizedBox(
                                width: 4,
                              ),
                              Text("NOW PLAYING",
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              e.titleNowPlaying,
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
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
}
