import 'package:movies_app/model/movies_genre.dart';
import 'package:movies_app/repository/movies_repo.dart';
import 'package:movies_app/service/init_getit.dart';

class GenreUtils {
  static List<MoviesGenre> movieGenreNames(List<int> genreIds) {
    final moviesRepository = getIt<MoviesRepository>();
    final cachedGenre = [];
    List<MoviesGenre> genresNames = [];
    for (var genreId in genreIds) {
      var genre = cachedGenre.firstWhere(
        (g) => g.id == genreId,
        orElse: () => MoviesGenre(id: 5448484, name: "Unknown"),
      );
      genresNames.add(genre);
    }
    return genresNames;
  }
}
