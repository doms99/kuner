import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(createToJson: false)
class BaseResponse {
  final bool success;

  BaseResponse({required this.success});

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);
}
