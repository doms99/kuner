import 'package:flutter/material.dart';
import 'package:kuner/ui/common/theme/number_theme.dart';
import 'package:kuner/gen/fonts.gen.dart';

class KunerTheme extends StatelessWidget {
  const KunerTheme({required this.child, super.key});

  static ThemeData themeData = _themeData;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeData,
      child: child,
    );
  }
}

final _colorScheme = ThemeData.dark().colorScheme.copyWith(
      brightness: Brightness.dark,
      primary: const Color(0xFF7952B3),
      onPrimary: const Color(0xFFECF3F6),
      secondary: const Color(0xFFFFD434),
      onSecondary: const Color(0xFF000000),
      background: const Color(0xFF000000),
      onBackground: const Color(0xFFF0FCFF),
      surface: const Color(0xFFE0E0E0),
      surfaceVariant: const Color(0xFF7C7C7C),
      onSurface: const Color(0xFF000000),
      onSurfaceVariant: const Color(0xFFFFDDDD),
    );

final _themeData = ThemeData(
  colorScheme: _colorScheme,
  primaryColor: _colorScheme.primary,
  accentColor: _colorScheme.secondary,
  splashColor: _colorScheme.surfaceVariant,
  highlightColor: Colors.transparent,
  errorColor: _colorScheme.error,
  // disabledColor: lookData.color // waiting for designer to add color name
  backgroundColor: _colorScheme.background,
  brightness: _colorScheme.brightness,
  cardColor: _colorScheme.surface,
  scaffoldBackgroundColor: _colorScheme.background,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: FontFamily.outfit,
      fontWeight: FontWeight.w500,
      fontSize: 50,
      height: 1.12,
    ),
    displayMedium: TextStyle(
      fontFamily: FontFamily.outfit,
      fontWeight: FontWeight.w500,
      fontSize: 40,
      height: 1.15,
    ),
    displaySmall: TextStyle(
      fontFamily: FontFamily.outfit,
      fontWeight: FontWeight.w500,
      fontSize: 30,
      height: 1.2,
    ),
    titleLarge: TextStyle(
      fontFamily: FontFamily.outfit,
      fontWeight: FontWeight.w500,
      fontSize: 24,
      height: 1.16667,
    ),
    titleMedium: TextStyle(
      fontFamily: FontFamily.outfit,
      fontWeight: FontWeight.w500,
      fontSize: 20,
      height: 1.2,
    ),
    titleSmall: TextStyle(
      fontFamily: FontFamily.outfit,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.25,
    ),
    bodyLarge: TextStyle(
      fontFamily: FontFamily.outfit,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.25,
    ),
    bodySmall: TextStyle(
      fontFamily: FontFamily.outfit,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.2857,
    ),
    labelLarge: TextStyle(
      fontFamily: FontFamily.outfit,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      height: 1.2857,
    ),
    labelSmall: TextStyle(
      fontFamily: FontFamily.outfit,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 1.2857,
    ),
  ),
  extensions: [
    NumberTheme(
      theme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: FontFamily.outfit,
          fontWeight: FontWeight.w500,
          fontSize: 56,
          height: 1.1071,
        ),
        displayMedium: TextStyle(
          fontFamily: FontFamily.outfit,
          fontWeight: FontWeight.w500,
          fontSize: 40,
          height: 1.15,
        ),
        displaySmall: TextStyle(
          fontFamily: FontFamily.outfit,
          fontWeight: FontWeight.w500,
          fontSize: 30,
          height: 1.2,
        ),
        titleLarge: TextStyle(
          fontFamily: FontFamily.outfit,
          fontWeight: FontWeight.w500,
          fontSize: 24,
          height: 1.16667,
        ),
        titleMedium: TextStyle(
          fontFamily: FontFamily.outfit,
          fontWeight: FontWeight.w500,
          fontSize: 20,
          height: 1.2,
        ),
        titleSmall: TextStyle(
          fontFamily: FontFamily.outfit,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          height: 1.25,
        ),
        bodyLarge: TextStyle(
          fontFamily: FontFamily.outfit,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 1.25,
        ),
        bodySmall: TextStyle(
          fontFamily: FontFamily.outfit,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 1.2857,
        ),
      ),
    ),
  ],
);
