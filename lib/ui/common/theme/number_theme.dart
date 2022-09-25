import 'package:flutter/material.dart';

class NumberTheme extends ThemeExtension<NumberTheme> {
  NumberTheme({
    required this.theme,
  });
  final TextTheme theme;

  @override
  ThemeExtension<NumberTheme> copyWith({TextTheme? theme}) {
    return NumberTheme(theme: theme ?? this.theme);
  }

  @override
  ThemeExtension<NumberTheme> lerp(ThemeExtension<NumberTheme>? other, double t) {
    return other ?? this;
  }
}

extension TypographyExtension on ThemeData {
  TextTheme get numberTheme => extension<NumberTheme>()!.theme;
}
