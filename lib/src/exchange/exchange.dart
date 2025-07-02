import 'package:dio/dio.dart';

abstract class ExchangeService {
  Future<Map<String, dynamic>> getSupportedAssetsExchangeRates();
}
