// Query service implementation will go here
// This file establishes the query folder structure
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
  // Add similar methods for the remaining endpoints as needed
}
