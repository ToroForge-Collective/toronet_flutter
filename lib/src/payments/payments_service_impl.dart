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

  @override
  Future<Map<String, dynamic>> confirmDeposit({
    required String currency,
    required String txid,
    String? paymentType,
    required String admin,
    required String adminpwd,
  }) async {
    return confirmDepositApi(
      dio: dio,
      baseUrl: baseUrl,
      currency: currency,
      txid: txid,
      paymentType: paymentType,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getBankListUSD() async {
    return getBankListUSDApi(dio: dio, baseUrl: baseUrl);
  }

  @override
  Future<List<Map<String, dynamic>>> getBankListNGN() async {
    return getBankListNGNApi(dio: dio, baseUrl: baseUrl);
  }

  @override
  Future<Map<String, dynamic>> recordFiatWithdrawal({
    required String address,
    required String password,
    required String currency,
    required String token,
    required String payername,
    required String payeremail,
    required String payeraddress,
    required String payercity,
    required String payerstate,
    required String payercountry,
    required String payerzipcode,
    required String payerphone,
    required String description,
    required String amount,
    required String accounttype,
    required String bankname,
    required String routingno,
    required String accountno,
    String? expirydate,
    required String accountname,
    required String recipientstate,
    required String recipientzip,
    required String recipientphone,
    required String admin,
    required String adminpwd,
  }) async {
    return recordFiatWithdrawalApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      password: password,
      currency: currency,
      token: token,
      payername: payername,
      payeremail: payeremail,
      payeraddress: payeraddress,
      payercity: payercity,
      payerstate: payerstate,
      payercountry: payercountry,
      payerzipcode: payerzipcode,
      payerphone: payerphone,
      description: description,
      amount: amount,
      accounttype: accounttype,
      bankname: bankname,
      routingno: routingno,
      accountno: accountno,
      expirydate: expirydate,
      accountname: accountname,
      recipientstate: recipientstate,
      recipientzip: recipientzip,
      recipientphone: recipientphone,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> getFiatWithdrawalByTxid({
    required String txid,
    required String admin,
    required String adminpwd,
  }) async {
    return getFiatWithdrawalByTxidApi(
      dio: dio,
      baseUrl: baseUrl,
      txid: txid,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> verifyBankAccountNameNGN({
    required String destinationInstitutionCode,
    required String accountNumber,
    required String admin,
    required String adminpwd,
  }) async {
    return verifyBankAccountNameNGNApi(
      dio: dio,
      baseUrl: baseUrl,
      destinationInstitutionCode: destinationInstitutionCode,
      accountNumber: accountNumber,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> getFiatTransactionByTxid({
    required String txid,
    required String admin,
    required String adminpwd,
  }) async {
    return getFiatTransactionByTxidApi(
      dio: dio,
      baseUrl: baseUrl,
      txid: txid,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getPendingTransaction({
    required String admin,
    required String adminpwd,
  }) async {
    return getPendingTransactionApi(
      dio: dio,
      baseUrl: baseUrl,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getFiatTransactionsAddressRange({
    required String address,
    required String startDate,
    required String endDate,
    required String admin,
    required String adminpwd,
  }) async {
    return getFiatTransactionsAddressRangeApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      startDate: startDate,
      endDate: endDate,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getFiatWithdrawalsAddressRange({
    required String address,
    required String startDate,
    required String endDate,
    required String admin,
    required String adminpwd,
  }) async {
    return getFiatWithdrawalsAddressRangeApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      startDate: startDate,
      endDate: endDate,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getFiatTransactionsRecorderRange({
    required String address,
    required String startDate,
    required String endDate,
    String? currency,
    String? token,
    required String admin,
    required String adminpwd,
  }) async {
    return getFiatTransactionsRecorderRangeApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      startDate: startDate,
      endDate: endDate,
      currency: currency,
      token: token,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getFiatWithdrawalsRecorderRange({
    required String address,
    required String startDate,
    required String endDate,
    String? currency,
    String? token,
    required String admin,
    required String adminpwd,
  }) async {
    return getFiatWithdrawalsRecorderRangeApi(
      dio: dio,
      baseUrl: baseUrl,
      address: address,
      startDate: startDate,
      endDate: endDate,
      currency: currency,
      token: token,
      admin: admin,
      adminpwd: adminpwd,
    );
  }
}
