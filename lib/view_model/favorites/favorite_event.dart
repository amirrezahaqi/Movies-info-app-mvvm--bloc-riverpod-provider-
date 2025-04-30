part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavoritesEvent extends FavoriteEvent {}

class AddToFavoritesEvent extends FavoriteEvent {
  final MovieModel movieModel;

  const AddToFavoritesEvent({required this.movieModel});

  @override
  List<Object> get props => [movieModel];
}

class RemoveFromFavoritesEvent extends FavoriteEvent {
  final MovieModel movieModel;

  const RemoveFromFavoritesEvent({required this.movieModel});

  @override
  List<Object> get props => [movieModel];
}

class RemoveAllFavoritesEvent extends FavoriteEvent {}
