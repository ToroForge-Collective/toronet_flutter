import 'package:dio/dio.dart';

abstract class BlockchainService {
  Future<Map<String, dynamic>> getBlockchainStatus();
  Future<Map<String, dynamic>> getLatestBlockData();
  Future<List<Map<String, dynamic>>> getBlocksData(int count);
  Future<List<Map<String, dynamic>>> getBlockchainTransactions(int count);
}
