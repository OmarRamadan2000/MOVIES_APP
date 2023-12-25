import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/Movies/data/data_sources/tv_remote_data_source.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/repositories/tv_repo.dart';

class TvRepoImpl extends TvRepo {
  final TvRemoteDataSourceImpl tvRemoteDataSource;

  TvRepoImpl(this.tvRemoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getTvModel(
      {int pageNumber = 1}) async {
    try {
      var tv = await tvRemoteDataSource.getTv(pageNumber: pageNumber);

      return right(tv);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
