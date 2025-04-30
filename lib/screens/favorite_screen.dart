import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants/my_app_colors.dart';
import 'package:movies_app/constants/my_app_icons.dart';
import 'package:movies_app/service/init_getit.dart';
import 'package:movies_app/view_model/favorites/favorite_bloc.dart';
import 'package:movies_app/widgets/movies/movies_widget.dart';
import 'package:movies_app/widgets/my_err_widget.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  const FavoriteMoviesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" favorite movie app"),
        actions: [
          IconButton(
            onPressed: () async {
              getIt<FavoriteBloc>().add(RemoveAllFavoritesEvent());
            },
            icon: MyAppIcons.delete,
            color: MyAppColors.redColor,
          ),
        ],
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is FavoriteError) {
            return Center(
              child: MyErrWidget(
                errText: state.message,
                errbtnonPress: () {
                  getIt<FavoriteBloc>().add(LoadFavoritesEvent());
                },
              ),
            );
          } else if (state is FavoriteLoaded) {
            if (state.favorites.isEmpty) {
              return Center(child: Text("No Favorites Items"));
            }

            return ListView.builder(
              itemCount: state.favorites.length,
              itemBuilder: (BuildContext, index) {
                return MoviesWidget(movieModel: state.favorites[index]);
              },
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
