import 'package:dio/dio.dart';
import '../payments/payments.dart';

Future<Map<String, dynamic>> depositFundsApi({
  required Dio dio,
  required String baseUrl,
  required String userAddress,
  required String username,
  required String amount,
  required Currency currency,
  required String admin,
  required String adminpwd,
}) async {
  final response = await dio.post(
    '$baseUrl/payments/deposit',
    data: {
      'userAddress': userAddress,
      'username': username,
      'amount': amount,
      'currency': currency.name,
      'admin': admin,
      'adminpwd': adminpwd,
    },
  );
  return response.data;
}
