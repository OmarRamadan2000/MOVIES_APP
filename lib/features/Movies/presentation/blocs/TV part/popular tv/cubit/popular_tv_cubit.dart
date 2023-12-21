import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/tv_usecase.dart';

part 'popular_tv_state.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit(this.poplarTvUseCase) : super(PopularTvInitial());
  final TvUseCase poplarTvUseCase;
  Future<void> getpoplarTv() async {
    emit(PopularTvLoding());
    var result = await poplarTvUseCase.call();

    result.fold((failure) {
      emit(PopularTvFailure(failure.message));
    }, (onTheAirTv) {
      emit(PopularTvsuccess(onTheAirTv));
    });
  }
}
