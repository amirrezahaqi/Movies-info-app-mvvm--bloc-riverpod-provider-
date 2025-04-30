part of 'favorite_bloc.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteLoaded extends FavoriteState {
  final List<MovieModel> favorites;

  const FavoriteLoaded({required this.favorites});

  @override
  List<Object> get props => [favorites];
}

final class FavoriteError extends FavoriteState {
  final String message;

  const FavoriteError({required this.message});

  @override
  List<Object> get props => [message];
}
