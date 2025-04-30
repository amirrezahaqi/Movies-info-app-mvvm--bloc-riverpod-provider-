import 'package:get_it/get_it.dart';
import 'package:movies_app/repository/movies_repo.dart';
import 'package:movies_app/service/api_service.dart';
import 'package:movies_app/service/navigation_service.dart';
import 'package:movies_app/view_model/favorites/favorite_bloc.dart';
import 'package:movies_app/view_model/movies/movies_bloc.dart' show MoviesBloc;
import 'package:movies_app/view_model/theme/theme_bloc.dart';

GetIt getIt = GetIt.instance;

void setuplocator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  getIt.registerLazySingleton<MoviesRepository>(
    () => MoviesRepository(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
  getIt.registerLazySingleton<MoviesBloc>(() => MoviesBloc());
  getIt.registerLazySingleton<FavoriteBloc>(() => FavoriteBloc());
}
