// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CacheRecord _$CacheRecordFromJson(Map<String, dynamic> json) => CacheRecord(
      timestamp: DateTime.parse(json['timestamp'] as String),
      value: json['value'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CacheRecordToJson(CacheRecord instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'value': instance.value,
    };
