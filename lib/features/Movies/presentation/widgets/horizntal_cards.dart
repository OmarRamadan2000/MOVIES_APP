import 'package:flutter/material.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/presentation/pages/list_cards.dart';
import 'package:movie_app/features/Movies/presentation/pages/movie_info.dart';
import 'package:movie_app/features/Movies/presentation/widgets/component.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HorizntalCards extends StatelessWidget {
  const HorizntalCards(
      {super.key,
      required this.movie,
      required this.cateName,
      required this.isMovie});
  final List<MovieEntity> movie;
  final String cateName;
  final bool isMovie;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(cateName),
              const Spacer(),
              InkWell(
                onTap: () {
                  navigateTo(
                      context,
                      ListCards(
                        categoryTitle: cateName,
                        movie: movie,
                        isMovie: isMovie,
                      ));
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: ListCards(
                      categoryTitle: cateName,
                      movie: movie,
                      isMovie: isMovie,
                    ),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: Row(
                  children: [
                    Text("see more",
                        style: Theme.of(context).textTheme.titleSmall),
                    const Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Icon(
                          Icons.chevron_right_sharp,
                          size: 20,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 130,
          child: ListView.builder(
            itemCount: movie.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: MovieInfo(movie: movie[index], isMovie: isMovie),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.sizeUp,
                  );
                },
                child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: squareImage(movie[index].posterTv!)),
              );
            },
          ),
        ),
      ],
    );
  }
}
