import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/Movies/data/data_sources/now_playing_data_source.dart';
import 'package:movie_app/features/Movies/domain/entities/now_playing_entity.dart';
import 'package:movie_app/features/Movies/domain/repositories/now_playing_repo.dart';

class NowPlayingRepoImpl extends NowPlayingRepo {
  final NowPlayingRemoteDataSource nowPlayingRemoteDataSource;

  NowPlayingRepoImpl(this.nowPlayingRemoteDataSource);

  @override
  Future<Either<Failure, List<NowPlayingEntity>>> getNowPlaying() async {
    try {
      var nowplaying = await nowPlayingRemoteDataSource.getNowPlaying();

      return right(nowplaying);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
