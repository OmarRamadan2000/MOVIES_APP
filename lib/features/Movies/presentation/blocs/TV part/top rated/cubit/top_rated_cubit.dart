import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/tv_usecase.dart';

part 'top_rated_state.dart';

class TopRatedTvCubit extends Cubit<TopRatedState> {
  TopRatedTvCubit(this.topRatedTvUseCase)
      : super(const TopRatedInitial(topRatedTv: [], topRatedTvpagnation: []));
  final TvUseCase topRatedTvUseCase;
  int page = 1;
  Future<void> getTopRatedTv() async {
    emit(TopRatedTvLoding(
        topRatedTv: state.topRatedTv,
        topRatedTvpagnation: state.topRatedTvpagnation));
    var result = await topRatedTvUseCase.call(pageNumber: page);

    result.fold((failure) {
      emit(TopRatedTvFailure(failure.message,
          topRatedTv: state.topRatedTv,
          topRatedTvpagnation: state.topRatedTvpagnation));
    }, (topRatedTv) {
      if (page == 1) {
        page++;
        emit(TopRatedTvsuccess(
            topRatedTv: topRatedTv, topRatedTvpagnation: topRatedTv));
      } else {
        page++;
        emit(TopRatedTvPagnationsuccess(
            topRatedTv: state.topRatedTv, topRatedTvpagnation: topRatedTv));
      }
    });
  }
}
