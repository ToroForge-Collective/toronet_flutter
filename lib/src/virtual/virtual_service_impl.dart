import 'package:dio/dio.dart';
import 'virtual.dart';
import '../api/virtual_api.dart';

class VirtualServiceImpl implements VirtualService {
  final Dio dio;
  final String baseUrl;

  VirtualServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> createVirtualWallet({
    required String address,
    required String payername,
    required String currency,
    required String admin,
    required String adminPassword,
  }) {
    return createVirtualWalletApi(
      dio,
      baseUrl,
      address,
      payername,
      currency,
      admin,
      adminPassword,
    );
  }

  @override
  Future<Map<String, dynamic>> fetchVirtualWallet({
    required String virtualWalletId,
    required String admin,
    required String adminPassword,
  }) {
    return fetchVirtualWalletApi(
      dio,
      baseUrl,
      virtualWalletId,
      admin,
      adminPassword,
    );
  }

  @override
  Future<Map<String, dynamic>> fetchVirtualWalletByAddress({
    required String address,
    required String admin,
    required String adminPassword,
  }) {
    return fetchVirtualWalletByAddressApi(
      dio,
      baseUrl,
      address,
      admin,
      adminPassword,
    );
  }

  @override
  Future<Map<String, dynamic>> updateVirtualWalletTransactions({
    required String walletAddress,
    required String admin,
    required String adminPassword,
  }) {
    return updateVirtualWalletTransactionsApi(
      dio,
      baseUrl,
      walletAddress,
      admin,
      adminPassword,
    );
  }
}
