import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/Movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/features/Movies/domain/entities/now_playing_entity.dart';
import 'package:movie_app/features/Movies/domain/repositories/movie_repo.dart';

class MovieRepoImpl extends MovieRepo {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepoImpl(this.movieRemoteDataSource);

  @override
  Future<Either<Failure, List<NowPlayingEntity>>> getNowPlaying() async {
    try {
      var nowplaying = await movieRemoteDataSource.getNowPlaying();

      return right(nowplaying);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
