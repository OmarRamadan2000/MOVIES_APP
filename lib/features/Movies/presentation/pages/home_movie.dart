import 'package:flutter/material.dart';

import 'package:movie_app/features/Movies/presentation/widgets/now_playing.dart';

class HomeMovie extends StatelessWidget {
  const HomeMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [const NowPlayingWidget(), Expanded(child: Container())],
    ));
  }
}
