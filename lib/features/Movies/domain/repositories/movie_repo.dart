import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/Movies/domain/entities/now_playing_entity.dart';

abstract class MovieRepo {
  Future<Either<Failure, List<NowPlayingEntity>>> getNowPlaying();
}
