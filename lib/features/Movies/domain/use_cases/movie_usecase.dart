import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/Movies/domain/entities/now_playing_entity.dart';
import 'package:movie_app/features/Movies/domain/repositories/movie_repo.dart';

class MovieUseCase extends Usecase<List<NowPlayingEntity>> {
  final MovieRepo nowPlayingRepo;

  MovieUseCase(this.nowPlayingRepo);

  @override
  Future<Either<Failure, List<NowPlayingEntity>>> call() async {
    return nowPlayingRepo.getNowPlaying();
  }
}

abstract class Usecase<Type> {
  Future<Either<Failure, Type>> call();
}
