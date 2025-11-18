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

  Future<Map<String, dynamic>> confirmDeposit({
    required String currency,
    required String txid,
    String? paymentType,
    required String admin,
    required String adminpwd,
  });

  Future<List<Map<String, dynamic>>> getBankListUSD();

  Future<List<Map<String, dynamic>>> getBankListNGN();

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
  });

  Future<Map<String, dynamic>> getFiatWithdrawalByTxid({
    required String txid,
    required String admin,
    required String adminpwd,
  });

  Future<Map<String, dynamic>> verifyBankAccountNameNGN({
    required String destinationInstitutionCode,
    required String accountNumber,
    required String admin,
    required String adminpwd,
  });

  Future<Map<String, dynamic>> getFiatTransactionByTxid({
    required String txid,
    required String admin,
    required String adminpwd,
  });

  Future<List<Map<String, dynamic>>> getPendingTransaction({
    required String admin,
    required String adminpwd,
  });

  Future<List<Map<String, dynamic>>> getFiatTransactionsAddressRange({
    required String address,
    required String startDate,
    required String endDate,
    required String admin,
    required String adminpwd,
  });

  Future<List<Map<String, dynamic>>> getFiatWithdrawalsAddressRange({
    required String address,
    required String startDate,
    required String endDate,
    required String admin,
    required String adminpwd,
  });

  Future<List<Map<String, dynamic>>> getFiatTransactionsRecorderRange({
    required String address,
    required String startDate,
    required String endDate,
    String? currency,
    String? token,
    required String admin,
    required String adminpwd,
  });

  Future<List<Map<String, dynamic>>> getFiatWithdrawalsRecorderRange({
    required String address,
    required String startDate,
    required String endDate,
    String? currency,
    String? token,
    required String admin,
    required String adminpwd,
  });
}
