import 'package:freezed_annotation/freezed_annotation.dart';

part 'cache_record.g.dart';

@JsonSerializable()
class CacheRecord {
  final DateTime timestamp;
  final Map<String, dynamic> value;

  CacheRecord({required this.timestamp, required this.value});

  factory CacheRecord.fromJson(Map<String, dynamic> json) => _$CacheRecordFromJson(json);
  Map<String, dynamic> toJson() => _$CacheRecordToJson(this);
}
