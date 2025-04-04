import 'package:flutter/material.dart';
import 'package:movies_app/constants/my_app_colors.dart';
import 'package:movies_app/constants/my_app_icons.dart';
import 'package:movies_app/model/movies_model.dart';

// ignore: must_be_immutable
class FavoriteBtn extends StatefulWidget {
  const FavoriteBtn({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  State<FavoriteBtn> createState() => _FavoriteBtnState();
}

class _FavoriteBtnState extends State<FavoriteBtn> {
  final favoriteModelIds = [];

  @override
  Widget build(BuildContext context) {
    bool isFavorite = favoriteModelIds.contains(widget.movieModel.id);

    return IconButton(
      onPressed: () {
        if (isFavorite) {
          favoriteModelIds.remove(widget.movieModel.id);
        } else {
          favoriteModelIds.add(widget.movieModel.id);
        }
        setState(() {});
      },
      icon: isFavorite ? MyAppIcons.favIconbold : MyAppIcons.favIcon,
      color: isFavorite ? MyAppColors.redColor : MyAppColors.blackColor,
    );
  }
}
