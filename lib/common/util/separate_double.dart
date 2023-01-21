import 'dart:math';

extension SeparateDouble on double {
  int get whole => ceil() - this < 0.000001 ? ceil() : floor().toInt();

  int get decimal => customDecimal(decimals: 2);

  int customDecimal({int decimals = 2}) {
    return ((this - whole) * pow(10, decimals)).round();
  }
}
