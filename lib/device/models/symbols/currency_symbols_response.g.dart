// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_symbols_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencySymbolsResponse _$CurrencySymbolsResponseFromJson(
        Map<String, dynamic> json) =>
    CurrencySymbolsResponse(
      symbols: (json['symbols'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, CurrencySymbol.fromJson(e as Map<String, dynamic>)),
      ),
      success: json['success'] as bool,
    );
