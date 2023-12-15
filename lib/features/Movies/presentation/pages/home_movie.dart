import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class HomeMovie extends StatelessWidget {
  const HomeMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: CarouselSlider.builder(
                itemCount: 15,
                itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) =>
                    Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment(0, .55),
                                      colors: [
                                    AppColors.primary.withOpacity(.5),
                                    AppColors.primary.withOpacity(.0),
                                  ])),
                            ),
                            const Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Title movie",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ]),
                          ],
                        )),
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  height: MediaQuery.of(context).size.height * .5,
                ),
              )),
          Expanded(child: Container())
        ],
      ),
    ));
  }
}
