import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/presentation/pages/Movies/home_movie.dart';
import 'package:movie_app/features/Movies/presentation/pages/TV/home_tv.dart';
import 'package:movie_app/features/Movies/presentation/widgets/component.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({super.key, required this.movie, required this.isMovie});
  final MovieEntity movie;
  final bool isMovie;
  @override
  Widget build(BuildContext context) {
    String generes = '';
    movie.genres?.forEach(
        // ignore: prefer_interpolation_to_compose_strings
        (element) => generes += ' ' + AppStrings.genres[element]! + ',');

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
              //replace with our own icon data.
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                    Colors.black.withOpacity(.6),
                    Colors.black.withOpacity(.0)
                  ])),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CachedNetworkImage(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                fit: BoxFit.fill,
                imageUrl: AppStrings.image + movie.backdrop_path!,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.titleMovie!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RateRow(
                        relseaYear: movie.releaseYear!,
                        rate: movie.rate!,
                        yearColor: AppColors.grey),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      movie.overviewMovie!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Genres:",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: AppColors.grey2),
                        ),
                        Text(
                          generes.substring(0, generes.length - 1),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: AppColors.grey2),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "MORE LIKE THIS",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    isMovie
                        ? BulidSimilarMovie(
                            movieId: movie.idMovie!, isMovie: isMovie)
                        : BuildSimilarTv(
                            movieId: movie.idMovie!, isMovie: isMovie)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
