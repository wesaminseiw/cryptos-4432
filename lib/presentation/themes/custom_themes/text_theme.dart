import '../../styles/colors.dart';
import 'package:flutter/material.dart';

TextTheme lightTextTheme = TextTheme(
  //* display style
  displayLarge: const TextStyle().copyWith(fontSize: 54, fontWeight: FontWeight.w800, color: lightPrimaryTextColor),
  displayMedium: const TextStyle().copyWith(fontSize: 42, fontWeight: FontWeight.bold, color: lightPrimaryTextColor),
  displaySmall: const TextStyle().copyWith(fontSize: 36, fontWeight: FontWeight.w600, color: lightPrimaryTextColor),

  //* headline style
  headlineLarge: const TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: lightPrimaryTextColor),
  headlineMedium: const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: lightPrimaryTextColor),
  headlineSmall: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: lightPrimaryTextColor),

  //* label style
  titleLarge: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: lightPrimaryTextColor),
  titleMedium: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: lightPrimaryTextColor),
  titleSmall: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: lightPrimaryTextColor),

  //* body style
  bodyLarge: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: lightPrimaryTextColor),
  bodyMedium: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.normal, color: lightPrimaryTextColor),
  bodySmall: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: lightPrimaryTextColor.withOpacity(0.5)),

  //* body style
  labelLarge: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: lightPrimaryTextColor),
  labelMedium: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: lightPrimaryTextColor.withOpacity(0.5)),
);
TextTheme darkTextTheme = TextTheme(
  //* display style
  displayLarge: const TextStyle().copyWith(fontSize: 54, fontWeight: FontWeight.w800, color: darkPrimaryTextColor),
  displayMedium: const TextStyle().copyWith(fontSize: 42, fontWeight: FontWeight.bold, color: darkPrimaryTextColor),
  displaySmall: const TextStyle().copyWith(fontSize: 36, fontWeight: FontWeight.w600, color: darkPrimaryTextColor),

  //* headline style
  headlineLarge: const TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.bold, color: darkPrimaryTextColor),
  headlineMedium: const TextStyle().copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: darkPrimaryTextColor),
  headlineSmall: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: darkPrimaryTextColor),

  //* label style
  titleLarge: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: darkPrimaryTextColor),
  titleMedium: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: darkPrimaryTextColor),
  titleSmall: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: darkPrimaryTextColor),

  //* body style
  bodyLarge: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: darkPrimaryTextColor),
  bodyMedium: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.normal, color: darkPrimaryTextColor),
  bodySmall: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: darkPrimaryTextColor.withOpacity(0.5)),

  //* body style
  labelLarge: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: darkPrimaryTextColor),
  labelMedium: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.normal, color: darkPrimaryTextColor.withOpacity(0.5)),
);
