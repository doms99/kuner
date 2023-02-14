// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversion_rate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversionRateResponse _$ConversionRateResponseFromJson(
        Map<String, dynamic> json) =>
    ConversionRateResponse(
      query: json['query'] as Map<String, dynamic>,
      info: json['info'] as Map<String, dynamic>,
      historical: json['historical'] as bool,
      date: DateTime.parse(json['date'] as String),
      rate: (json['result'] as num).toDouble(),
      success: json['success'] as bool,
    );
