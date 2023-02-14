import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kuner/app/constants.dart';
import 'package:kuner/device/cache/cache.dart';
import 'package:kuner/device/cache/cache_record.dart';

class CacheInterceptor extends Interceptor {
  final Cache _cache;

  CacheInterceptor(this._cache);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!API.shouldCache(options.uri)) {
      return super.onRequest(options, handler);
    }

    final cacheResponse = await _cache.get(options.uri.toString());
    if (cacheResponse != null) {
      final cacheRecord = CacheRecord.fromJson(jsonDecode(cacheResponse) as Map<String, dynamic>);
      if (DateTime.now().isBefore(cacheRecord.timestamp)) {
        handler.resolve(Response<Map<String, dynamic>>(requestOptions: options, data: cacheRecord.value));
        return;
      } else {
        _cache.delete(options.uri.toString());
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (!API.shouldCache(response.requestOptions.uri)) {
      return super.onResponse(response, handler);
    }

    if (response.data is Map<String, dynamic>) {
      final cacheRecord = CacheRecord(
        value: response.data as Map<String, dynamic>,
        timestamp: DateTime.now().endOfDay,
      );
      _cache.put(response.requestOptions.uri.toString(), jsonEncode(cacheRecord.toJson()));
    }
    return super.onResponse(response, handler);
  }
}

extension EndOfDay on DateTime {
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999, 999);
}
