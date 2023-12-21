import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/movie_usecase.dart';

part 'movie_state.dart';

class NowPlayingCubit extends Cubit<MovieState> {
  NowPlayingCubit(this.nowPlayingUseCase) : super(MovieInitial());
  final MovieUseCase nowPlayingUseCase;

  Future<void> getNowPlaying() async {
    emit(NowPlayingLoding());
    var result = await nowPlayingUseCase.call();

    result.fold((failure) {
      emit(NowPlayingFailure(failure.message));
    }, (nowPlaying) {
      emit(NowPlayingsuccess(nowPlaying));
    });
  }
}
