import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_symbol.g.dart';

@JsonSerializable(createToJson: false)
class CurrencySymbol {
  final String description;
  final String code;

  CurrencySymbol({required this.description, required this.code});

  factory CurrencySymbol.fromJson(Map<String, dynamic> json) => _$CurrencySymbolFromJson(json);
}
