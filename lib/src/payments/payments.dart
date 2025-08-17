// ignore_for_file: constant_identifier_names

enum Currency { NGN, EUR, USD, GBP, KSH, ZAR }

abstract class PaymentsService {
  Future<Map<String, dynamic>> depositFunds({
    required String userAddress,
    required String username,
    required String amount,
    required Currency currency,
    required String admin,
    required String adminpwd,
  });
}
