import 'package:flutter/material.dart';
import 'package:movies_app/constants/my_app_colors.dart';

class MyAppIcons {
  static const Icon favIcon = Icon(Icons.favorite_border_rounded, size: 15);
  static const Icon favIconbold = Icon(Icons.favorite_sharp, size: 15);
  static const Icon darkMode = Icon(Icons.dark_mode_outlined, size: 15);
  static const Icon lightMode = Icon(
    Icons.light_mode_outlined,
    size: 15,
    color: MyAppColors.whiteColor,
  );
  static const Icon errIcon = Icon(
    Icons.error_outlined,
    size: 25,
    color: MyAppColors.redColor,
  );
  static const Icon delete = Icon(Icons.delete_forever_rounded, size: 15);
  static const Icon bakcArrow = Icon(Icons.arrow_back_ios_rounded, size: 18);
  static const Icon star = Icon(
    Icons.star,
    size: 15,
    color: MyAppColors.yellowColor,
  );
  static const Icon time = Icon(
    Icons.timer_sharp,
    size: 15,
    color: Colors.greenAccent,
  );
}
