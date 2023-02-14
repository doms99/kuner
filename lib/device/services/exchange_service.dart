import 'package:dio/dio.dart';
import 'package:kuner/app/constants.dart';
import 'package:kuner/device/models/rate/conversion_rate_response.dart';
import 'package:kuner/device/models/symbols/currency_symbols_response.dart';

abstract class ExchangeService {
  Future<CurrencySymbolsResponse> getCurrencySymbols();
  Future<ConversionRateResponse> getConversionRate(String from, String to);
}

class ExchangeServiceImpl implements ExchangeService {
  final Dio _dio;

  ExchangeServiceImpl(this._dio);

  @override
  Future<CurrencySymbolsResponse> getCurrencySymbols() async {
    final response = await _dio.get<Map<String, dynamic>>(API.symbols);

    return CurrencySymbolsResponse.fromJson(response.data!);
  }

  @override
  Future<ConversionRateResponse> getConversionRate(String from, String to) async {
    final url = API.rate(from: from.toUpperCase().trim(), to: to.toUpperCase().trim());
    final response = await _dio.get<Map<String, dynamic>>(url);

    return ConversionRateResponse.fromJson(response.data!);
  }
}
