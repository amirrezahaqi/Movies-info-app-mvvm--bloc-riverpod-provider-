import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/movies_genre.dart';
import 'package:movies_app/model/movies_model.dart';
import 'package:movies_app/utils/genre_utils.dart';
import 'package:movies_app/view_model/movies/movies_bloc.dart';

class GeneresListWidget extends StatelessWidget {
  const GeneresListWidget({
    super.key,
    required this.sized,
    required this.movieModel,
  });
  final double sized;
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoadedState || state is MoviesLoadingMoreState) {
          List<MoviesGenre> moviesGenre = GenreUtils.movieGenreNames(
            movieModel.genreIds,
            state is MoviesLoadedState
                ? state.genres
                : (state as MoviesLoadingMoreState).genres,
          );
          return SizedBox(
            width: sized,
            child: Wrap(
              children: List.generate(
                moviesGenre.length,
                (index) => ChipWidget(
                  context: context,
                  genreName: moviesGenre[index].name,
                ),
              ),
            ),
          );
        }
        return const Center(child: Text("در حال آماده‌سازی داده‌ها..."));
      },
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
