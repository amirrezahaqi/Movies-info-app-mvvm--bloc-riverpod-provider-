import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/constants/my_themes_data.dart';
import 'package:movies_app/screens/movies_screen.dart';
import 'package:movies_app/service/init_getit.dart';
import 'package:movies_app/service/navigation_service.dart';
import 'package:movies_app/view_model/favorites/favorite_bloc.dart';
import 'package:movies_app/view_model/movies/movies_bloc.dart';
import 'package:movies_app/view_model/theme/theme_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ThemeBloc>()..add(LoadThemeEvent()),
        ),
        BlocProvider(
          create: (context) => getIt<FavoriteBloc>()..add(LoadFavoritesEvent()),
        ),
        BlocProvider(create: (context) => getIt<MoviesBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: getIt.get<NavigationService>().navigatorKey,
            debugShowCheckedModeBanner: false,
            theme:
                state is LightThemeState
                    ? MyThemesData.lightTheme
                    : MyThemesData.darkTheme,
            home: MoviesScreen(),
            // home: SplashScreen(),
          );
        },
      ),
    );
  }
}
