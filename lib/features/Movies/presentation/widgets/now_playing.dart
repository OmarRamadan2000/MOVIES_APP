import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/presentation/pages/movie_info.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shimmer/shimmer.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({
    super.key,
    required this.movie,
    required this.live,
    required this.isMovie,
  });
  final List<MovieEntity> movie;
  final String live;
  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .35,
        child: CarouselSlider(
          items: movie
              .map(
                (e) => InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: MovieInfo(movie: e, isMovie: isMovie),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.sizeUp,
                    );
                  },
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        fit: BoxFit.fill,
                        height: MediaQuery.of(context).size.height * .35,
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
                                Text(live,
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                e.titleMovie!,
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            height: MediaQuery.of(context).size.height * .35,
          ),
        ));
  }
}
