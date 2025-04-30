part of 'movies_bloc.dart';

sealed class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

final class MoviesInitial extends MoviesState {}

final class MoviesLoadingState extends MoviesState {}

final class MoviesLoadedState extends MoviesState {
  final List<MovieModel> movies;
  final List<MoviesGenre> genres;
  final int curentPage;

  const MoviesLoadedState({
    this.movies = const [],
    this.genres = const [],
    this.curentPage = 0,
  });

  @override
  List<Object> get props => [movies, genres, curentPage];
}

final class MoviesLoadingMoreState extends MoviesState {
  final List<MovieModel> movies;
  final List<MoviesGenre> genres;
  final int curentPage;

  const MoviesLoadingMoreState({
    this.movies = const [],
    this.genres = const [],
    this.curentPage = 0,
  });

  @override
  List<Object> get props => [movies, genres, curentPage];
}

final class MoviesErrorState extends MoviesState {
  final String message;
  const MoviesErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
