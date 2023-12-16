import 'package:movie_app/core/api/api_service.dart';
import 'package:movie_app/core/utils/app_strings.dart';
import 'package:movie_app/features/Movies/data/models/now_playing_model.dart';

abstract class NowPlayingRemoteDataSource {
  Future<List<NowPlayingModel>> getNowPlaying();
}

class NowPlayingRemoteDataSourceImpl extends NowPlayingRemoteDataSource {
  final ApiService apiService;

  NowPlayingRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<NowPlayingModel>> getNowPlaying() async {
    var data = await apiService.get(endPoint: AppStrings.nowPlaying);
    //print(data.toString());
    List<NowPlayingModel> nowplayinglist = getnowplayinglist(data);

    return nowplayinglist;
  }

  List<NowPlayingModel> getnowplayinglist(Map<String, dynamic> data) {
    List<NowPlayingModel> list = [];
    for (var result in data["results"]) {
      list.add(NowPlayingModel.fromJson(result));
    }
    return list;
  }
}
