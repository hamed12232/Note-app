import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit()
      : super(ThemeData(
          brightness: Brightness.light,
          fontFamily: "poppins",
        ));

  void toggleTheme() {
    final isDarkMode = state.brightness == Brightness.dark;
    emit(ThemeData(
      brightness: isDarkMode ? Brightness.light : Brightness.dark,
      fontFamily: "poppins",
    ));
  }
}
