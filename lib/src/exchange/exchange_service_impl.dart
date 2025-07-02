import 'package:dio/dio.dart';
import 'exchange.dart';
import '../api/exchange_api.dart';

class ExchangeServiceImpl implements ExchangeService {
  final Dio dio;
  final String baseUrl;

  ExchangeServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> getSupportedAssetsExchangeRates() async {
    return fetchSupportedAssetsExchangeRates(dio, baseUrl);
  }
}
