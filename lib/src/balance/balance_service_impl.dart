import 'package:dio/dio.dart';
import 'balance.dart';
import '../api/balance_api.dart';

class BalanceServiceImpl implements BalanceService {
  final Dio dio;
  final String baseUrl;

  BalanceServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> getBalance({required String address}) async {
    return fetchBalance(dio, baseUrl, address);
  }
}
