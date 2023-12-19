import 'package:movie_app/core/api/api_service.dart';
import 'package:movie_app/features/Movies/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlaying();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiService apiService;
  final String endpoint;

  MovieRemoteDataSourceImpl(this.apiService, this.endpoint);

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    var data = await apiService.get(endPoint: endpoint);
    List<MovieModel> nowplayinglist = getnowplayinglist(data);

    return nowplayinglist;
  }

  List<MovieModel> getnowplayinglist(Map<String, dynamic> data) {
    List<MovieModel> list = [];
    for (var result in data["results"]) {
      list.add(MovieModel.fromJson(result));
    }

    return list;
  }
}
