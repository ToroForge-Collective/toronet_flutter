import 'package:dio/dio.dart';
import '../api/query_api.dart';
import 'query.dart';

class QueryServiceImpl implements QueryService {
  final Dio dio;
  final String baseUrl;

  QueryServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> getEvent({required String hash}) {
    return getEventApi(dio, baseUrl, hash);
  }

  @override
  Future<List<Map<String, dynamic>>> getBlocks({required int count}) {
    return getBlocksApi(dio, baseUrl, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactions({required int count}) {
    return getTransactionsApi(dio, baseUrl, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getAddrTransactions({
    required String addr,
    required int count,
  }) {
    return getAddrTransactionsApi(dio, baseUrl, addr, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactionsToro({required int count}) {
    return getTransactionsToroApi(dio, baseUrl, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getAddrTransactionsToro({
    required String addr,
    required int count,
  }) {
    return getAddrTransactionsToroApi(dio, baseUrl, addr, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactionsDollar({
    required int count,
  }) {
    return getTransactionsDollarApi(dio, baseUrl, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getAddrTransactionsDollar({
    required String addr,
    required int count,
  }) {
    return getAddrTransactionsDollarApi(dio, baseUrl, addr, count);
  }

  // Add similar methods for the remaining endpoints as needed
}
