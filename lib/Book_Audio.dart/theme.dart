import 'package:flutter/material.dart';

class lightDarkTheme {
  static Brightness brightness = Brightness.light;
  static void changeBrightness() {
    if (brightness == Brightness.light) {
      brightness = Brightness.dark;
    } else {
      brightness = Brightness.light;
    }
  }

  static ThemeData getTheme() {
    return ThemeData(
      backgroundColor: Colors.blue[100],
      brightness: brightness,
      primaryColorLight: Colors.blue,
      primaryColorDark: const Color.fromARGB(255, 56, 56, 56),
      scaffoldBackgroundColor: brightness == Brightness.light
          ? Colors.blue[100]
          : const Color.fromARGB(255, 45, 45, 45),
      cardColor: brightness == Brightness.light
          ? Colors.blue[200]
          : const Color.fromARGB(255, 40, 40, 40),
      listTileTheme: ListTileThemeData(
        tileColor: brightness == Brightness.light
            ? Colors.white
            : const Color.fromARGB(255, 40, 40, 40),
      ),
      iconTheme: IconThemeData(
        color: brightness == Brightness.light
            ? const Color.fromARGB(255, 40, 40, 40)
            : Colors.white,
      ),
    );
  }
}
