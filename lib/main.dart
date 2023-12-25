import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/themes/app_themes.dart';
import 'package:movie_app/core/utils/Funcations/get_it.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/blocObserver.dart';
import 'package:movie_app/features/Movies/domain/use_cases/movie_usecase.dart';
import 'package:movie_app/features/Movies/domain/use_cases/tv_usecase.dart';
import 'package:movie_app/features/Movies/presentation/blocs/Movie%20part/now%20playing/cubit/movie_cubit.dart';
import 'package:movie_app/features/Movies/presentation/blocs/Movie%20part/popular/cubit/popular_cubit.dart';
import 'package:movie_app/features/Movies/presentation/blocs/Movie%20part/top%20rated/cubit/top_rated_cubit.dart';
import 'package:movie_app/features/Movies/presentation/blocs/TV%20part/popular%20tv/cubit/popular_tv_cubit.dart';
import 'package:movie_app/features/Movies/presentation/blocs/TV%20part/top%20rated/cubit/top_rated_cubit.dart';
import 'package:movie_app/features/Movies/presentation/pages/home.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  getMovieData();
  getTVData();
  runApp(const MyApp());
}

final getMovie = GetIt.instance;
final getTV = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return NowPlayingCubit(
              getMovie.get<MovieUseCase>(param1: AppStrings.nowPlaying))
            ..getNowPlaying();
        }),
        BlocProvider(create: (context) {
          return PopularCubit(
              getMovie.get<MovieUseCase>(param1: AppStrings.popular))
            ..getPopular();
        }),
        BlocProvider(create: (context) {
          return TopRatedCubit(
              getMovie.get<MovieUseCase>(param1: AppStrings.topRated))
            ..getTopRated();
        }),
        BlocProvider(
            create: (context) => PopularTvCubit(
                getTV.get<TvUseCase>(param1: AppStrings.popularTv))
              ..getpoplarTv()),
        BlocProvider(
          create: (context) => TopRatedTvCubit(
              getTV.get<TvUseCase>(param1: AppStrings.topRatedTv))
            ..getTopRatedTv(),
        )
      ],
      child: MaterialApp(
        title: 'MOVIE APP',
        theme: appTheme(),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}
