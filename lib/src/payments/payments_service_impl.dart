import 'package:dio/dio.dart';
import 'payments.dart';
import '../api/payments_api.dart';

/// Implements PaymentsService using the paymentsUrl (https://payments.connectw.com) for all requests.
class PaymentsServiceImpl implements PaymentsService {
  final Dio dio;
  final String baseUrl;

  PaymentsServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> depositFunds({
    required String userAddress,
    required String username,
    required String amount,
    required Currency currency,
    required String admin,
    required String adminpwd,
  }) async {
    return depositFundsApi(
      dio: dio,
      baseUrl: baseUrl,
      userAddress: userAddress,
      username: username,
      amount: amount,
      currency: currency,
      admin: admin,
      adminpwd: adminpwd,
    );
  }
}
