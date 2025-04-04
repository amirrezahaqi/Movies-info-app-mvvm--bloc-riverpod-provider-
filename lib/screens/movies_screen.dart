import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_app/constants/my_app_colors.dart';
import 'package:movies_app/constants/my_app_icons.dart';
import 'package:movies_app/model/movies_genre.dart';
import 'package:movies_app/model/movies_model.dart';
import 'package:movies_app/repository/movies_repo.dart';
import 'package:movies_app/screens/favorite_screen.dart';
import 'package:movies_app/service/init_getit.dart';
import 'package:movies_app/service/navigation_service.dart';
import 'package:movies_app/widgets/movies/movies_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final List<MovieModel> _movies = [];
  int _curentPage = 1;
  bool _isfetching = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchMovies();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isfetching) {
      _fetchMovies();
    }
  }

  Future<void> _fetchMovies() async {
    if (_isfetching) return;
    setState(() {
      _isfetching = true;
    });
    try {
      final List<MovieModel> movies = await getIt<MoviesRepository>()
          .fetchMovies(page: _curentPage);
      setState(() {
        _movies.addAll(movies);
        _curentPage++;
      });
    } catch (error) {
      getIt<NavigationService>().showSnackBar("error message is $error");
    } finally {
      setState(() {
        _isfetching = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("movie app"),
        actions: [
          IconButton(
            onPressed: () async {
              () => getIt<NavigationService>().navigate(FavoriteMoviesScreen());
            },
            icon: MyAppIcons.favIcon,
            color: MyAppColors.redColor,
          ),

          IconButton(
            onPressed: () async {
              final List<MoviesGenre> genre =
                  await getIt<MoviesRepository>().fetchGenres();

              print("message:$genre");
              log("message:$genre");
              log("message");
              // final List<MovieModel> movies =
              //     await getIt<ApiService>().fetchMovies();
              // print("message:$movies");
            },
            icon: MyAppIcons.darkMode,
            color: MyAppColors.blackColor,
          ),
        ],
      ),

      body: Center(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _movies.length + (_isfetching ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < _movies.length) {
              return MoviesWidget(movieModel: _movies[index]);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
