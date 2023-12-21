import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/Movies/presentation/pages/home_movie.dart';
import 'package:movie_app/features/Movies/presentation/pages/home_tv.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        hideNavigationBar: false,
        backgroundColor: AppColors.secondary,
        context,
        screens: _buildScreens(),
        items: navBarItems(),
        navBarStyle: NavBarStyle.style3,
        //backgroundColor: ,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [const HomeMovie(), const HomeTv()];
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.movie_creation_rounded),
          activeColorPrimary: Colors.white,
          activeColorSecondary: Colors.black),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.tv_rounded),
          activeColorPrimary: Colors.white,
          activeColorSecondary: Colors.black)
    ];
  }
}
