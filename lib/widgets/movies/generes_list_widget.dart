import 'package:flutter/material.dart';
import 'package:movies_app/constants/my_app_constants.dart';
import 'package:movies_app/model/movies_genre.dart';
import 'package:movies_app/utils/genre_utils.dart';

class GeneresListWidget extends StatelessWidget {
  const GeneresListWidget({super.key, required this.sized});
  final double sized;
  @override
  Widget build(BuildContext context) {
    List<MoviesGenre> moviesGenre = GenreUtils.movieGenreNames([]);
    MediaQuery.sizeOf(context);
    return SizedBox(
      width: sized,
      child: Wrap(
        children: List.generate(
          MyAppConstants.genresList.length,
          (index) => ChipWidget(
            context: context,
            genreName: MyAppConstants.genresList[index],
          ),
        ),
      ),
    );
  }

  Widget ChipWidget({
    required String genreName,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 149, 192, 212),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          child: Text(
            genreName,
            style: TextStyle(
              fontSize: 9,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
