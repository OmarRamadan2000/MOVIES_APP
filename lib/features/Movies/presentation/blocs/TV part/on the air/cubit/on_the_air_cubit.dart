import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/tv_usecase.dart';

part 'on_the_air_state.dart';

class OnTheAirCubit extends Cubit<OnTheAirState> {
  OnTheAirCubit(this.onTheAirUseCase) : super(OnTheAirInitial());

  final TvUseCase onTheAirUseCase;
  Future<void> getonTheAir() async {
    emit(OnTheAirLoding());
    var result = await onTheAirUseCase.call();

    result.fold((failure) {
      emit(OnTheAirFailure(failure.message));
    }, (onTheAirTv) {
      emit(OnTheAirsuccess(onTheAirTv));
    });
  }
}
