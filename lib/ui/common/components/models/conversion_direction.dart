// ignore_for_file: constant_identifier_names

import 'package:kuner/ui/common/components/models/currency.dart';

enum ConversionDirection {
  hrk_eur,
  eur_hrk;

  ConversionDirection get other {
    switch (this) {
      case ConversionDirection.eur_hrk:
        return ConversionDirection.hrk_eur;
      case ConversionDirection.hrk_eur:
        return ConversionDirection.eur_hrk;
    }
  }

  Currency get input {
    switch (this) {
      case ConversionDirection.eur_hrk:
        return Currency.eur;
      case ConversionDirection.hrk_eur:
        return Currency.hrk;
    }
  }

  Currency get output {
    switch (this) {
      case ConversionDirection.eur_hrk:
        return Currency.hrk;
      case ConversionDirection.hrk_eur:
        return Currency.eur;
    }
  }

  @override
  String toString() {
    switch (this) {
      case ConversionDirection.eur_hrk:
        return 'eur_hrk';
      case ConversionDirection.hrk_eur:
        return 'hrk_eur';
    }
  }

  static ConversionDirection? fromString(String? value) {
    switch (value) {
      case 'eur_hrk':
        return ConversionDirection.eur_hrk;
      case 'hrk_eur':
        return ConversionDirection.hrk_eur;
      default:
        return null;
    }
  }
}
