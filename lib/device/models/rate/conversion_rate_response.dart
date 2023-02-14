import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kuner/device/models/base_response.dart';

part 'conversion_rate_response.g.dart';

@JsonSerializable(createToJson: false)
class ConversionRateResponse extends BaseResponse {
  final Map<String, dynamic> query;
  final Map<String, dynamic> info;
  final bool historical;
  final DateTime date;
  @JsonKey(name: 'result')
  final double rate;

  ConversionRateResponse({
    required this.query,
    required this.info,
    required this.historical,
    required this.date,
    required this.rate,
    required bool success,
  }) : super(success: success);

  factory ConversionRateResponse.fromJson(Map<String, dynamic> json) => _$ConversionRateResponseFromJson(json);
}
