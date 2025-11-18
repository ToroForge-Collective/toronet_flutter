import 'package:dio/dio.dart';
import '../api/query_api.dart';
import 'query_service.dart';

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

  @override
  Future<Map<String, dynamic>> getExchangeRates() {
    return getExchangeRatesApi(dio, baseUrl);
  }

  @override
  Future<Map<String, dynamic>> getAddrRole({required String addr}) {
    return getAddrRoleApi(dio, baseUrl, addr);
  }

  @override
  Future<Map<String, dynamic>> getAddrBalance({required String addr}) {
    return getAddrBalanceApi(dio, baseUrl, addr);
  }

  @override
  Future<Map<String, dynamic>> getBlock({required String blockId}) {
    return getBlockApi(dio, baseUrl, blockId);
  }

  @override
  Future<Map<String, dynamic>> getTransaction({required String hash}) {
    return getTransactionByIdApi(dio, baseUrl, hash);
  }

  @override
  Future<Map<String, dynamic>> getReceipt({required String hash}) {
    return getReceiptApi(dio, baseUrl, hash);
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactionsNaira({
    required int count,
  }) {
    return getTransactionsNairaApi(dio, baseUrl, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getAddrTransactionsNaira({
    required String addr,
    required int count,
  }) {
    return getAddrTransactionsNairaApi(dio, baseUrl, addr, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactionsEuro({required int count}) {
    return getTransactionsEuroApi(dio, baseUrl, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getAddrTransactionsEuro({
    required String addr,
    required int count,
  }) {
    return getAddrTransactionsEuroApi(dio, baseUrl, addr, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactionsPound({
    required int count,
  }) {
    return getTransactionsPoundApi(dio, baseUrl, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getAddrTransactionsPound({
    required String addr,
    required int count,
  }) {
    return getAddrTransactionsPoundApi(dio, baseUrl, addr, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactionsEgp({required int count}) {
    return getTransactionsEgpApi(dio, baseUrl, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getAddrTransactionsEgp({
    required String addr,
    required int count,
  }) {
    return getAddrTransactionsEgpApi(dio, baseUrl, addr, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactionsKsh({required int count}) {
    return getTransactionsKshApi(dio, baseUrl, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getAddrTransactionsKsh({
    required String addr,
    required int count,
  }) {
    return getAddrTransactionsKshApi(dio, baseUrl, addr, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactionsZar({required int count}) {
    return getTransactionsZarApi(dio, baseUrl, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getAddrTransactionsZar({
    required String addr,
    required int count,
  }) {
    return getAddrTransactionsZarApi(dio, baseUrl, addr, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactionsEth({required int count}) {
    return getTransactionsEthApi(dio, baseUrl, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getAddrTransactionsEth({
    required String addr,
    required int count,
  }) {
    return getAddrTransactionsEthApi(dio, baseUrl, addr, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getTransactionsRange({
    required String startDate,
    required String endDate,
    required int count,
  }) {
    return getTransactionsRangeApi(dio, baseUrl, startDate, endDate, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getAddrTransactionsRange({
    required String addr,
    required String startDate,
    required String endDate,
    String? token,
    required int count,
  }) {
    return getAddrTransactionsRangeApi(
      dio,
      baseUrl,
      addr,
      startDate,
      endDate,
      token,
      count,
    );
  }
}
