import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kuner/app/constants.dart';
import 'package:kuner/device/dio/cache_interceptor.dart';

Dio createDio(GetIt getIt) {
  final dio = Dio();
  dio.options.baseUrl = API.baseURL;
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 5);
  dio.interceptors.add(CacheInterceptor(getIt.get()));
  return dio;
}
