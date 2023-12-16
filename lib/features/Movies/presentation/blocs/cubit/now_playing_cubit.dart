import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Movies/domain/entities/now_playing_entity.dart';
import 'package:movie_app/features/Movies/domain/use_cases/now_play_usecase.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit(this.nowPlayingUseCase) : super(NowPlayingInitial());
  final NowPlayingUseCase nowPlayingUseCase;

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
