import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/screens/movies_screen.dart';
import 'package:movies_app/service/init_getit.dart';
import 'package:movies_app/service/navigation_service.dart';
import 'package:movies_app/view_model/favorites/favorite_bloc.dart';
import 'package:movies_app/view_model/movies/movies_bloc.dart';
import 'package:movies_app/widgets/my_err_widget.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final moviesBloc = getIt<MoviesBloc>();
  final favoritesBloc = getIt<FavoriteBloc>();
  final navigationService = getIt<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<MoviesBloc, MoviesState>(
            bloc: moviesBloc..add(FetchMoviesEvent()),
            listener: (context, state) {
              if (state is MoviesLoadedState &&
                  favoritesBloc.state is FavoriteLoaded) {
                navigationService.navigateReplace(MoviesScreen());
              } else if (state is MoviesErrorState) {
                navigationService.showSnackBar(state.message);
              }
            },
          ),
          BlocListener<FavoriteBloc, FavoriteState>(
            bloc: favoritesBloc..add(LoadFavoritesEvent()),
            listener: (context, state) {
              if (state is FavoriteError) {
                navigationService.showSnackBar(state.message);
              }
            },
          ),
        ],
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state is MoviesLoadingState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("is Loading ..."),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
              );
            } else if (state is MoviesErrorState) {
              return MyErrWidget(
                errText: state.message,
                errbtnonPress: () {
                  moviesBloc.add(FetchMoviesEvent());
                },
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
