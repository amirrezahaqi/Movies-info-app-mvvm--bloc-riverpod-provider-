import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/model/movies_genre.dart';
import 'package:movies_app/model/movies_model.dart';
import 'package:movies_app/repository/movies_repo.dart';
import 'package:movies_app/service/init_getit.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {
    on<FetchMoviesEvent>(_onFetchMovies);
    on<FetchMoreMoviesEvent>(_onFetchMoreMovies);
  }
  final MoviesRepository moviesRepository = getIt.get<MoviesRepository>();
  Future<void> _onFetchMovies(event, emit) async {
    emit(MoviesLoadingState());
    try {
      var genres = await moviesRepository.fetchGenres();
      // log("genres is ${genres.length}" );
      print("genres is $genres");
      var movies = await moviesRepository.fetchMovies(page: 1);
      emit(MoviesLoadedState(curentPage: 1, genres: genres, movies: movies));
    } catch (e) {
      emit(MoviesErrorState(message: "error is $e"));
    }
  }

  Future<void> _onFetchMoreMovies(event, emit) async {
    final currentState = state;

    if (currentState is MoviesLoadingMoreState) {
      return;
    }
    if (currentState is! MoviesLoadedState) {
      return;
    }
    emit(
      MoviesLoadingMoreState(
        curentPage: currentState.curentPage,
        genres: currentState.genres,
        movies: currentState.movies,
      ),
    );
    try {
      List<MovieModel> movies = await moviesRepository.fetchMovies(
        page: currentState.curentPage + 1,
      );
      if (movies.isEmpty) {
        emit(currentState);
        return;
      }
      currentState.movies.addAll(movies);
      emit(
        MoviesLoadedState(
          curentPage: currentState.curentPage + 1,
          genres: currentState.genres,
          movies: currentState.movies,
        ),
      );
    } catch (e) {
      emit(MoviesErrorState(message: 'erroe is $e'));
    }
  }
}
