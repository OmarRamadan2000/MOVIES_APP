import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/presentation/pages/movie_info.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class RateRow extends StatelessWidget {
  const RateRow(
      {super.key,
      required this.relseaYear,
      required this.rate,
      required this.yearColor});
  final String relseaYear;
  final double rate;
  final Color yearColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Container(
            color: yearColor,
            height: 20,
            width: 40,
            child: Center(
                child: Text(DateTime.parse(relseaYear).year.toString(),
                    style: Theme.of(context).textTheme.titleSmall)),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Icon(Icons.star_rate, color: AppColors.yellow, size: 16),
        const SizedBox(
          width: 5,
        ),
        Text(rate.toStringAsFixed(1),
            style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}

class GridImage extends StatelessWidget {
  const GridImage({super.key, required this.movies, required this.isMovie});
  final List<MovieEntity> movies;
  final bool isMovie;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 30),
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 1 / 1.5,
      children: List.generate(6, (index) {
        return InkWell(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: MovieInfo(movie: movies[index], isMovie: isMovie),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.sizeUp,
            );
          },
          child: squareImage(movies[index].posterTv != null
              ? movies[index].posterTv!
              : "https://image.tmdb.org/t/p/w500/zNhUmqYeDHklzGyfYbOq1F9zaAb.jpg"),
        );
      }),
    );
  }
}

Widget squareImage(
  String imagePath,
) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(7),
    child: CachedNetworkImage(
      height: 130,
      width: 90,
      fit: BoxFit.fill,
      imageUrl: AppStrings.image + imagePath,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    ),
  );
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );
