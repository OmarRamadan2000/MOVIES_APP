import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/movie_usecase.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit(this.popularUseCase) : super(PopularInitial());

  final MovieUseCase popularUseCase;
  Future<void> getPopular() async {
    emit(PopularLoding());
    var result = await popularUseCase.call();

    result.fold((failure) {
      emit(PopularFailure(failure.message));
    }, (popular) {
      emit(Popularsuccess(popular));
    });
  }
}
