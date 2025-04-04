import 'package:flutter/material.dart';
import 'package:movies_app/constants/my_app_colors.dart';
import 'package:movies_app/constants/my_app_icons.dart';

class MyErrWidget extends StatelessWidget {
  const MyErrWidget({
    super.key,
    required this.errText,

    required this.errbtnonPress,
  });

  final String errText;

  final Function errbtnonPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyAppIcons.errIcon,
        SizedBox(height: 15),
        Text("Error : $errText", style: TextStyle(color: MyAppColors.redColor)),
        SizedBox(height: 15),
        ElevatedButton(onPressed: errbtnonPress(), child: Text("retry")),
      ],
    );
  }
}
