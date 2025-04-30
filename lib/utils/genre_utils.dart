import 'package:movies_app/model/movies_genre.dart';

class GenreUtils {
  static List<MoviesGenre> movieGenreNames(
    List<int> genreIds,
    List<MoviesGenre> allGenreList,
  ) {
    List<MoviesGenre> genresNames = [];
    for (var genreId in genreIds) {
      var genre = allGenreList.firstWhere(
        (g) => g.id == genreId,
        orElse: () => MoviesGenre(id: 5448484, name: "Unknown"),
      );
      genresNames.add(genre);
    }
    return genresNames;
  }
}
