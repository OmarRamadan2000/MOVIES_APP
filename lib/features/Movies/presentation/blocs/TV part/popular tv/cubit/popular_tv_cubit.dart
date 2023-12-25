import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/tv_usecase.dart';

part 'popular_tv_state.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  int page = 1;
  PopularTvCubit(this.poplarTvUseCase)
      : super(PopularTvInitial(popularTvPagnation: [], popularTv: []));
  final TvUseCase poplarTvUseCase;
  Future<void> getpoplarTv() async {
    emit(PopularTvLoding(
        popularTv: state.popularTv,
        popularTvPagnation: state.popularTvPagnation));
    var result = await poplarTvUseCase.call(pageNumber: page);

    result.fold((failure) {
      emit(PopularTvFailure(failure.message,
          popularTv: state.popularTv,
          popularTvPagnation: state.popularTvPagnation));
    }, (popular) {
      if (page == 1) {
        page++;
        emit(PopularTvsuccess(popularTv: popular, popularTvPagnation: popular));
        //emit(TopRatedPaginationsuccess(topRated));
      } else {
        page++;
        emit(PopularTvPagnationsuccess(
            popularTv: state.popularTv, popularTvPagnation: popular));
      }
    });
  }
}
