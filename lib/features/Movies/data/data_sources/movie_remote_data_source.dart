import 'package:movie_app/core/api/api_service.dart';
import 'package:movie_app/features/Movies/data/models/movie_model.dart';

class MovieRemoteDataSourceImpl {
  final ApiService apiService;
  final String endpoint;

  MovieRemoteDataSourceImpl(this.apiService, this.endpoint);

  Future<List<MovieModel>> getMovie() async {
    var data = await apiService.get(endPoint: endpoint);
    List<MovieModel> nowplayinglist = getMovieList(data);

    return nowplayinglist;
  }

  List<MovieModel> getMovieList(Map<String, dynamic> data) {
    List<MovieModel> list = [];
    for (var result in data["results"]) {
      list.add(MovieModel.fromJson(result));
    }

    return list;
  }
}
