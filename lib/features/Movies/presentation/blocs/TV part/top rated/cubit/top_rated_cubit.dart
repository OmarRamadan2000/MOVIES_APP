import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/tv_usecase.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit(this.topRatedTvUseCase) : super(TopRatedInitial());
  final TvUseCase topRatedTvUseCase;
  Future<void> getTopRatedTv() async {
    emit(TopRatedTvLoding());
    var result = await topRatedTvUseCase.call();

    result.fold((failure) {
      emit(TopRatedTvFailure(failure.message));
    }, (topRatedTv) {
      emit(TopRatedTvsuccess(topRatedTv));
    });
  }
}
