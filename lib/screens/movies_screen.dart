import 'package:flutter/material.dart';
import 'package:movies_app/constants/my_app_colors.dart';
import 'package:movies_app/constants/my_app_icons.dart';
import 'package:movies_app/screens/favorite_screen.dart'
    show FavoriteMoviesScreen;
import 'package:movies_app/service/init_getit.dart';
import 'package:movies_app/service/navigation_service.dart';
import 'package:movies_app/widgets/movies/movies_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("movie app"),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigate(const FavoriteMoviesScreen());
            },
            icon: MyAppIcons.favIcon,
          ),
          IconButton(
            onPressed: () async {},
            icon: MyAppIcons.darkMode,
            color: MyAppColors.blackColor,
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return MoviesWidget();
          },
        ),
      ),
    );
  }
}
