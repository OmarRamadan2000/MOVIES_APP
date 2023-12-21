import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/repositories/movie_repo.dart';

class MovieUseCase extends Usecase<List<MovieEntity>> {
  final MovieRepo nowPlayingRepo;
  MovieUseCase(this.nowPlayingRepo);

  @override
  Future<Either<Failure, List<MovieEntity>>> call() async {
    return nowPlayingRepo.getMovieModel();
  }
}

abstract class Usecase<Type> {
  Future<Either<Failure, Type>> call();
}
