import 'package:dio/dio.dart';
import 'blockchain.dart';
import '../api/blockchain_api.dart';

class BlockchainServiceImpl implements BlockchainService {
  final Dio dio;
  final String baseUrl;

  BlockchainServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> getBlockchainStatus() async {
    return fetchBlockchainStatus(dio, baseUrl);
  }

  @override
  Future<Map<String, dynamic>> getLatestBlockData() async {
    return fetchLatestBlockData(dio, baseUrl);
  }

  @override
  Future<List<Map<String, dynamic>>> getBlocksData(int count) async {
    return fetchBlocksData(dio, baseUrl, count);
  }

  @override
  Future<List<Map<String, dynamic>>> getBlockchainTransactions(
    int count,
  ) async {
    return fetchBlockchainTransactions(dio, baseUrl, count);
  }
}
