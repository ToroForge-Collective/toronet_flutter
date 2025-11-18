abstract class QueryService {
  Future<Map<String, dynamic>> getEvent({required String hash});
  Future<List<Map<String, dynamic>>> getBlocks({required int count});
  Future<List<Map<String, dynamic>>> getTransactions({required int count});
  Future<List<Map<String, dynamic>>> getAddrTransactions({
    required String addr,
    required int count,
  });
  Future<List<Map<String, dynamic>>> getTransactionsToro({required int count});
  Future<List<Map<String, dynamic>>> getAddrTransactionsToro({
    required String addr,
    required int count,
  });
  Future<List<Map<String, dynamic>>> getTransactionsDollar({
    required int count,
  });
  Future<List<Map<String, dynamic>>> getAddrTransactionsDollar({
    required String addr,
    required int count,
  });
  Future<Map<String, dynamic>> getExchangeRates();
  Future<Map<String, dynamic>> getAddrRole({required String addr});
  Future<Map<String, dynamic>> getAddrBalance({required String addr});
  Future<Map<String, dynamic>> getBlock({required String blockId});
  Future<Map<String, dynamic>> getTransaction({required String hash});
  Future<Map<String, dynamic>> getReceipt({required String hash});
  Future<List<Map<String, dynamic>>> getTransactionsNaira({required int count});
  Future<List<Map<String, dynamic>>> getAddrTransactionsNaira({
    required String addr,
    required int count,
  });
  Future<List<Map<String, dynamic>>> getTransactionsEuro({required int count});
  Future<List<Map<String, dynamic>>> getAddrTransactionsEuro({
    required String addr,
    required int count,
  });
  Future<List<Map<String, dynamic>>> getTransactionsPound({required int count});
  Future<List<Map<String, dynamic>>> getAddrTransactionsPound({
    required String addr,
    required int count,
  });
  Future<List<Map<String, dynamic>>> getTransactionsEgp({required int count});
  Future<List<Map<String, dynamic>>> getAddrTransactionsEgp({
    required String addr,
    required int count,
  });
  Future<List<Map<String, dynamic>>> getTransactionsKsh({required int count});
  Future<List<Map<String, dynamic>>> getAddrTransactionsKsh({
    required String addr,
    required int count,
  });
  Future<List<Map<String, dynamic>>> getTransactionsZar({required int count});
  Future<List<Map<String, dynamic>>> getAddrTransactionsZar({
    required String addr,
    required int count,
  });
  Future<List<Map<String, dynamic>>> getTransactionsEth({required int count});
  Future<List<Map<String, dynamic>>> getAddrTransactionsEth({
    required String addr,
    required int count,
  });
  Future<List<Map<String, dynamic>>> getTransactionsRange({
    required String startDate,
    required String endDate,
    required int count,
  });
  Future<List<Map<String, dynamic>>> getAddrTransactionsRange({
    required String addr,
    required String startDate,
    required String endDate,
    String? token,
    required int count,
  });
}
