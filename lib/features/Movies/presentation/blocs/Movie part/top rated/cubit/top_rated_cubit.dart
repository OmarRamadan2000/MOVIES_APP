import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/movie_usecase.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit(this.topRatedUseCase)
      : super(
            const TopRatedInitial(topRatedMovies: [], topRatedMoviespage: []));
  int page = 1;
  final MovieUseCase topRatedUseCase;
  Future<void> getTopRated() async {
    emit(TopRatedLoding(
        topRatedMovies: state.topRatedMovies,
        topRatedMoviespage: state.topRatedMoviespage));

    var result = await topRatedUseCase.call(pageNumber: page);

    result.fold((failure) {
      emit(TopRatedFailure(failure.message,
          topRatedMovies: state.topRatedMovies,
          topRatedMoviespage: state.topRatedMoviespage));
    }, (topRated) {
      if (page == 1) {
        page++;
        emit(TopRatedsuccess(
            topRatedMoviespage: topRated, topRatedMovies: topRated));
        //emit(TopRatedPaginationsuccess(topRated));
      } else {
        page++;
        emit(TopRatedPaginationsuccess(
            topRatedMovies: state.topRatedMovies,
            topRatedMoviespage: topRated));
      }
    });
  }
}
