import 'package:dio/dio.dart';
import 'package:movie_app/core/api/api_service.dart';
import 'package:movie_app/features/Movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/features/Movies/data/data_sources/tv_remote_data_source.dart';
import 'package:movie_app/features/Movies/data/repositories_impl/movie_repo_impl.dart';
import 'package:movie_app/features/Movies/data/repositories_impl/tv_repoImpl.dart';
import 'package:movie_app/features/Movies/domain/use_cases/movie_usecase.dart';
import 'package:movie_app/features/Movies/domain/use_cases/tv_usecase.dart';
import 'package:movie_app/main.dart';

void getMovieData() {
  getMovie.registerFactoryParam<MovieUseCase, String, dynamic>(
      (endpoint, _) => MovieUseCase(
            MovieRepoImpl(
              MovieRemoteDataSourceImpl(ApiService(Dio()), endpoint),
            ),
          ));
}

void getTVData() {
  getTV.registerFactoryParam<TvUseCase, String, dynamic>((endpoint, _) =>
      TvUseCase(
          TvRepoImpl(TvRemoteDataSourceImpl(ApiService(Dio()), endpoint))));
}
