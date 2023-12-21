import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/repositories/tv_repo.dart';
import 'package:movie_app/features/Movies/domain/use_cases/movie_usecase.dart';

class TvUseCase extends Usecase<List<MovieEntity>> {
  final TvRepo tvRepo;

  TvUseCase(this.tvRepo);

  @override
  Future<Either<Failure, List<MovieEntity>>> call() async {
    return tvRepo.getTvModel();
  }
}
