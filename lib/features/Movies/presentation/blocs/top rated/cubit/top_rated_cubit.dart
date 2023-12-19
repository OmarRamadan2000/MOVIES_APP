import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Movies/domain/entities/now_playing_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/movie_usecase.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit(this.topRatedUseCase) : super(TopRatedInitial());

  final MovieUseCase topRatedUseCase;
  Future<void> getTopRated() async {
    emit(TopRatedLoding());
    var result = await topRatedUseCase.call();

    result.fold((failure) {
      emit(TopRatedFailure(failure.message));
    }, (topRated) {
      emit(TopRatedsuccess(topRated));
    });
  }
}
