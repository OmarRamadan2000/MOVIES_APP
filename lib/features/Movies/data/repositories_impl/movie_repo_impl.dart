import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/Movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/repositories/movie_repo.dart';

class MovieRepoImpl extends MovieRepo {
  final MovieRemoteDataSourceImpl movieRemoteDataSource;

  MovieRepoImpl(this.movieRemoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovieModel(
      {int pageNumber = 1}) async {
    try {
      var movie = await movieRemoteDataSource.getMovie(pageNumber: pageNumber);

      return right(movie);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
