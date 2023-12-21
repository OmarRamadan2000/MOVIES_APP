import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/movie_usecase.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit(this.similarUseCase) : super(SimilarInitial());

  final MovieUseCase similarUseCase;
  Future<void> getSimilar() async {
    emit(SimilarLoding());
    var result = await similarUseCase.call();

    result.fold((failure) {
      emit(SimilarFailure(failure.message));
    }, (popular) {
      emit(Similarsuccess(popular));
    });
  }
}
