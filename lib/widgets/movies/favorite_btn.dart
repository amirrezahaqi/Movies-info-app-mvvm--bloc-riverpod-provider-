import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants/my_app_icons.dart';
import 'package:movies_app/model/movies_model.dart';
import 'package:movies_app/service/init_getit.dart';
import 'package:movies_app/service/navigation_service.dart';
import 'package:movies_app/view_model/favorites/favorite_bloc.dart';

class FavoriteBtn extends StatelessWidget {
  const FavoriteBtn({super.key, required this.movieModel});

  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    final navigationService = getIt<NavigationService>();
    return BlocConsumer<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        bool isFavorite =
            (state is FavoriteLoaded) &&
            state.favorites.any((movie) => movie.id == movieModel.id);

        return IconButton(
          onPressed: () {
            getIt<FavoriteBloc>().add(
              isFavorite
                  ? RemoveFromFavoritesEvent(movieModel: movieModel)
                  : AddToFavoritesEvent(movieModel: movieModel),
            );
          },
          icon: Icon(
            (isFavorite
                ? MyAppIcons.favIconbold.icon
                : MyAppIcons.favIcon.icon),
            size: 15,
          ),
        );
      },
      listener: (context, state) {
        if (state is FavoriteError) {
          return navigationService.showSnackBar("Error :${state.message}");
        }
      },
    );
  }
}
