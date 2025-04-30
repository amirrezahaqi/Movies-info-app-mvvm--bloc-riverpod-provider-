import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants/my_themes_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ToggleThemeEvent>(_toggleTheme);
    on<LoadThemeEvent>(_loadTheme);
  }
  final prefsKey = "isdarkmode";

  Future<void> _loadTheme(event, emit) async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(prefsKey) ?? true;
    if (isDarkMode) {
      emit(DarkThemeState(themeData: MyThemesData.darkTheme));
    } else {
      emit(LightThemeState(themeData: MyThemesData.lightTheme));
    }
  }

  Future<void> _toggleTheme(event, emit) async {
    final prefs = await SharedPreferences.getInstance();
    final currentState = state;
    if (currentState is LightThemeState) {
      emit(DarkThemeState(themeData: MyThemesData.darkTheme));
      await prefs.setBool(prefsKey, true);
    } else {
      emit(LightThemeState(themeData: MyThemesData.lightTheme));
      await prefs.setBool(prefsKey, false);
    }
  }
}
