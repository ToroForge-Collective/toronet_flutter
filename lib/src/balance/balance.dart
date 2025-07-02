import 'package:dio/dio.dart';

abstract class BalanceService {
  Future<Map<String, dynamic>> getBalance({required String address});
}
