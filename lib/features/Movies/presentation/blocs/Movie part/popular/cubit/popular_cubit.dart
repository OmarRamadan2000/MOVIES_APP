import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/movie_usecase.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit(this.popularUseCase)
      : super(const PopularInitial(
            popularmoviespagnation: [], popularmovies: []));
  int page = 1;
  final MovieUseCase popularUseCase;
  Future<void> getPopular() async {
    emit(PopularLoding(
        popularmoviespagnation: state.popularmoviespagnation,
        popularmovies: state.popularmovies));
    var result = await popularUseCase.call(pageNumber: page);
    result.fold((failure) {
      emit(PopularFailure(failure.message,
          popularmoviespagnation: state.popularmoviespagnation,
          popularmovies: state.popularmovies));
    }, (popular) {
      if (page == 1) {
        page++;
        emit(Popularsuccess(
            popularmovies: popular, popularmoviespagnation: popular));
        //emit(TopRatedPaginationsuccess(topRated));
      } else {
        page++;
        emit(Popularsuccesspagnation(
            popularmovies: state.popularmovies,
            popularmoviespagnation: popular));
      }
    });
  }
}
