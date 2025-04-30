import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/model/movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<LoadFavoritesEvent>(_LoadFavorites);
    on<AddToFavoritesEvent>(_addToFavorites);
    on<RemoveFromFavoritesEvent>(_removeFromoFavorites);
    on<RemoveAllFavoritesEvent>(_ClearAllfavs);
  }

  final favsKey = "favsKey";

  Future<void> _saveFavorites(List<MovieModel> favoritesList) async {
    final prefs = await SharedPreferences.getInstance();
    final stringList =
        favoritesList.map((movie) => json.encode(movie.toJson())).toList();
    prefs.setStringList(favsKey, stringList);
  }

  // bool _isFavorite(MovieModel movieModel) {
  //   if (state is FavoriteLoaded) {
  //     return (state as FavoriteLoaded).favorites.any(
  //       (movie) => movie.id == movieModel.id,
  //     );
  //   }
  //   return false;
  // }

  Future<void> _addToFavorites(AddToFavoritesEvent event, emit) async {
    // emit(FavoriteError(message: "err"));
    // throw Exception("error");
    if (state is FavoriteInitial) {
      print("state is FavoriteIntial");
    }

    if (state is FavoriteLoaded) {
      List<MovieModel> updateFavorites = List.from(
        (state as FavoriteLoaded).favorites,
      )..add(event.movieModel);
      emit(FavoriteLoaded(favorites: updateFavorites));
      await _saveFavorites(updateFavorites);
    }
  }

  Future<void> _removeFromoFavorites(
    RemoveFromFavoritesEvent event,
    emit,
  ) async {
    if (state is FavoriteLoaded) {
      List<MovieModel> updateFavorites =
          (state as FavoriteLoaded).favorites
              .where((movie) => movie.id != event.movieModel.id)
              .toList();
      emit(FavoriteLoaded(favorites: updateFavorites));
      await _saveFavorites(updateFavorites);
    }
  }

  Future<void> _LoadFavorites(event, emit) async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList(favsKey) ?? [];
    final favsList =
        stringList
            .map((movie) => MovieModel.fromJson(json.decode(movie)))
            .toList();
    emit(FavoriteLoaded(favorites: favsList));
  }

  void _ClearAllfavs(event, emit) {
    emit(FavoriteLoaded(favorites: []));
    _saveFavorites([]);
  }
}
