import 'package:flutter/material.dart';
import 'package:movies_app/constants/my_app_colors.dart';
import 'package:movies_app/constants/my_app_icons.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  const FavoriteMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" favorite movie app"),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: MyAppIcons.favIcon,
            color: MyAppColors.redColor,
          ),
        ],
      ),

      body: Center(
        child: ListView.builder(
          itemCount: 1,
          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
          itemBuilder: (BuildContext, index) {
            return null;

            // return MoviesWidget(movie: null,);
          },
        ),
      ),
    );
  }
}
