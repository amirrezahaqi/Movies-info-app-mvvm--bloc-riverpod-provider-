import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants/my_app_icons.dart';
import 'package:movies_app/screens/favorite_screen.dart'
    show FavoriteMoviesScreen;
import 'package:movies_app/service/init_getit.dart';
import 'package:movies_app/service/navigation_service.dart';
import 'package:movies_app/view_model/movies/movies_bloc.dart';
import 'package:movies_app/view_model/theme/theme_bloc.dart';
import 'package:movies_app/widgets/movies/movies_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // فراخوانی رویداد فقط یکبار در شروع صفحه
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bloc = getIt<MoviesBloc>();
      if (bloc.state is MoviesInitial) {
        bloc.add(FetchMoviesEvent());
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie App"),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigate(FavoriteMoviesScreen());
            },
            icon: MyAppIcons.favIcon,
          ),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  getIt<ThemeBloc>().add(ToggleThemeEvent());
                },
                icon:
                    state is DarkThemeState
                        ? MyAppIcons.lightMode
                        : MyAppIcons.darkMode,
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is MoviesErrorState) {
            log(state.message);
            return Center(child: Text(state.message));
          } else if (state is MoviesLoadedState ||
              state is MoviesLoadingMoreState) {
            final movies =
                state is MoviesLoadedState
                    ? state.movies
                    : (state as MoviesLoadingMoreState).movies;

            final isLoadingMore = state is MoviesLoadingMoreState;

            return NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent &&
                    !isLoadingMore) {
                  getIt<MoviesBloc>().add(FetchMoreMoviesEvent());
                  return true;
                }
                return false;
              },
              child: ListView.builder(
                itemCount: isLoadingMore ? movies.length + 1 : movies.length,
                itemBuilder: (context, index) {
                  if (index >= movies.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  }
                  return MoviesWidget(movieModel: movies[index]);
                },
              ),
            );
          } else {
            return const Center(child: Text("در حال آماده‌سازی داده‌ها..."));
          }
        },
      ),
    );
  }
}
