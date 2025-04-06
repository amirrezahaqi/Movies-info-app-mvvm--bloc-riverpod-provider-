import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("is Loading ..."),
            SizedBox(height: 20),
            SizedBox(height: 20, width: 20, child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
