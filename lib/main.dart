import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/constants/my_themes_data.dart';
import 'package:movies_app/screens/movies_screen.dart';
import 'package:movies_app/service/init_getit.dart';
import 'package:movies_app/service/navigation_service.dart';

void main() {
  setuplocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) async {
    await dotenv.load(fileName: ".env");
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt.get<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: MyThemesData.lightTheme,
      home: MoviesScreen(),
      // home: SplashScreen(),
    );
  }
}
