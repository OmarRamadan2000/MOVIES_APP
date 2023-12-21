import 'package:movie_app/core/api/api_service.dart';
import 'package:movie_app/features/Movies/data/models/tv_model.dart';

class TvRemoteDataSourceImpl {
  final ApiService apiService;
  final String endpoint;

  TvRemoteDataSourceImpl(this.apiService, this.endpoint);

  List<TvModel> getnowplayinglist(Map<String, dynamic> data) {
    List<TvModel> list = [];
    for (var result in data["results"]) {
      list.add(TvModel.fromJson(result));
    }

    return list;
  }

  Future<List<TvModel>> getTv() async {
    var data = await apiService.get(endPoint: endpoint);
    List<TvModel> nowplayinglist = getnowplayinglist(data);

    return nowplayinglist;
  }
}
