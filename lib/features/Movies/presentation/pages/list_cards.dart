import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/Movies/domain/entities/now_playing_entity.dart';
import 'package:movie_app/features/Movies/presentation/widgets/component.dart';

class ListCards extends StatelessWidget {
  const ListCards(
      {super.key, required this.categoryTitle, required this.movie});
  final String categoryTitle;
  final List<NowPlayingEntity> movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Center(child: Text(categoryTitle)),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        color: AppColors.secondary,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 150,
                  color: AppColors.primary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: squareImage(movie[index].backdrop_path!),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              movie[index].titleNowPlaying,
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(3),
                                  child: Container(
                                    color: AppColors.red,
                                    height: 20,
                                    width: 40,
                                    child: Center(
                                        child: Text(
                                            DateTime.parse(
                                                    movie[index].releaseYear)
                                                .year
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall)),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Icon(Icons.star_rate,
                                    color: AppColors.yellow, size: 16),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(movie[index].rate.toStringAsFixed(1),
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Text(
                                movie[index].overviewMovie,
                                style: Theme.of(context).textTheme.titleSmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
