import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/presentation/pages/movie_info.dart';
import 'package:movie_app/features/Movies/presentation/widgets/component.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ListCards extends StatelessWidget {
  const ListCards(
      {super.key,
      required this.categoryTitle,
      required this.movie,
      required this.isMovie});
  final String categoryTitle;
  final List<MovieEntity> movie;
  final bool isMovie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(categoryTitle),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        color: AppColors.secondary,
        child: ListView.builder(
          itemCount: movie.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: MovieInfo(
                        movie: movie[index],
                        isMovie: isMovie,
                      ),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.sizeUp,
                    );
                  },
                  child: Container(
                    height: 150,
                    color: AppColors.primary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: squareImage(movie[index].posterTv!),
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
                                movie[index].titleMovie!,
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              RateRow(
                                relseaYear: movie[index].releaseYear!,
                                rate: movie[index].rate!,
                                yearColor: AppColors.red,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: Text(
                                  movie[index].overviewMovie!,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
