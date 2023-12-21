import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/api/api_service.dart';
import 'package:movie_app/core/themes/app_themes.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/core/utils/blocObserver.dart';
import 'package:movie_app/features/Movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/features/Movies/data/repositories_impl/movie_repo_impl.dart';
import 'package:movie_app/features/Movies/domain/use_cases/movie_usecase.dart';
import 'package:movie_app/features/Movies/presentation/blocs/Movie%20part/now%20playing/cubit/movie_cubit.dart';
import 'package:movie_app/features/Movies/presentation/blocs/Movie%20part/popular/cubit/popular_cubit.dart';
import 'package:movie_app/features/Movies/presentation/blocs/Movie%20part/top%20rated/cubit/top_rated_cubit.dart';
import 'package:movie_app/features/Movies/presentation/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return NowPlayingCubit(
            MovieUseCase(
              MovieRepoImpl(
                MovieRemoteDataSourceImpl(
                    ApiService(Dio()), AppStrings.nowPlaying),
              ),
            ),
          )..getNowPlaying();
        }),
        BlocProvider(create: (context) {
          return PopularCubit(
            MovieUseCase(
              MovieRepoImpl(
                MovieRemoteDataSourceImpl(
                    ApiService(Dio()), AppStrings.popular),
              ),
            ),
          )..getPopular();
        }),
        BlocProvider(create: (context) {
          return TopRatedCubit(
            MovieUseCase(
              MovieRepoImpl(
                MovieRemoteDataSourceImpl(
                    ApiService(Dio()), AppStrings.topRated),
              ),
            ),
          )..getTopRated();
        })
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
