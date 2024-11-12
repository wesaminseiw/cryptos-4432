import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/colors.dart';
import '../themes/custom_themes/text_theme.dart';

ThemeData lightTheme() => ThemeData(
      fontFamily: 'Montserrat',
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: lightPrimaryColor,
        onPrimary: lightTertiaryColor,
        secondary: lightSecondaryColor,
        onSecondary: lightTertiaryColor,
        error: Colors.red,
        onError: lightSecondaryColor,
        surface: lightSecondaryColor,
        onSurface: lightTertiaryColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: lightSecondaryColor,
          statusBarColor: Colors.transparent,
        ),
      ),
      scaffoldBackgroundColor: lightSecondaryColor,
      textTheme: lightTextTheme,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: lightTertiaryColor,
      ),
      iconTheme: IconThemeData(color: lightTertiaryColor),
    );

// ThemeData darkTheme() => ThemeData(
//       fontFamily: 'Montserrat',
//       appBarTheme: const AppBarTheme(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         systemOverlayStyle: SystemUiOverlayStyle(
//           statusBarBrightness: Brightness.dark,
//           statusBarIconBrightness: Brightness.light,
//           systemNavigationBarColor: darkSecondaryColor,
//           statusBarColor: Colors.transparent,
//         ),
//       ),
//       scaffoldBackgroundColor: darkSecondaryColor,
//       textTheme: darkTextTheme,
//       progressIndicatorTheme: const ProgressIndicatorThemeData(
//         color: darkTertiaryColor,
//       ),
//     );
