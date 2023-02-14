import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kuner/device/models/base_response.dart';
import 'package:kuner/device/models/symbols/currency_symbol.dart';

part 'currency_symbols_response.g.dart';

@JsonSerializable(createToJson: false)
class CurrencySymbolsResponse extends BaseResponse {
  final Map<String, CurrencySymbol> symbols;

  CurrencySymbolsResponse({required this.symbols, required bool success}) : super(success: success);

  factory CurrencySymbolsResponse.fromJson(Map<String, dynamic> json) => _$CurrencySymbolsResponseFromJson(json);
}
