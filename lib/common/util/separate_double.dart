import 'dart:math';

extension SeparateDouble on double {
  int get whole => floor().toInt();

  int get decimal => customDecimal(decimals: 2);

  int customDecimal({int decimals = 2}) {
    final whole = floor().toInt();
    return ((this - whole) * pow(10, decimals)).round();
  }
}
