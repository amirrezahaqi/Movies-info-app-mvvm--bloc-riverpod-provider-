import 'package:movies_app/model/movies_genre.dart';
import 'package:movies_app/model/movies_model.dart';
import 'package:movies_app/service/api_service.dart';

class MoviesRepository {
  final ApiService _apiService;
  MoviesRepository(this._apiService);

  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    return await _apiService.fetchMovies(page: page);
  }

  List<MoviesGenre> cachedGenre = [];
  Future<List<MoviesGenre>> fetchGenres() async {
    return cachedGenre = await _apiService.fetchGenres();
  }
}
