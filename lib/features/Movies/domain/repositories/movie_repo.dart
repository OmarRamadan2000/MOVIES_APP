import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';

abstract class MovieRepo {
  Future<Either<Failure, List<MovieEntity>>> getMovieModel(
      {int pageNumber = 1});
}
