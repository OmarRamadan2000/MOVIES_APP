import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/Movies/domain/entities/now_playing_entity.dart';
import 'package:movie_app/features/Movies/domain/repositories/now_playing_repo.dart';

class NowPlayingUseCase extends Usecase<List<NowPlayingEntity>> {
  final NowPlayingRepo nowPlayingRepo;

  NowPlayingUseCase(this.nowPlayingRepo);

  @override
  Future<Either<Failure, List<NowPlayingEntity>>> call() async {
    return nowPlayingRepo.getNowPlaying();
  }
}

abstract class Usecase<Type> {
  Future<Either<Failure, Type>> call();
}
