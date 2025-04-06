import 'package:flutter/material.dart';
import 'package:movies_app/constants/my_app_colors.dart';
import 'package:movies_app/constants/my_app_icons.dart';

class FavoriteBtn extends StatelessWidget {
  const FavoriteBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: MyAppIcons.favIcon,
      color: MyAppColors.redColor,
    );
  }
}
