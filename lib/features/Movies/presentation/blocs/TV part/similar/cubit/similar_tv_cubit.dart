import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/tv_usecase.dart';

part 'similar_tv_state.dart';

class SimilarTvCubit extends Cubit<SimilarTvState> {
  SimilarTvCubit(this.similarTvUseCase) : super(SimilarTvInitial());
  final TvUseCase similarTvUseCase;
  Future<void> getpoplarTv() async {
    emit(SimilarTvLoding());
    var result = await similarTvUseCase.call();

    result.fold((failure) {
      emit(SimilarTvFailure(failure.message));
    }, (onTheAirTv) {
      emit(SimilarTvsuccess(onTheAirTv));
    });
  }
}
