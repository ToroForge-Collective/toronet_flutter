import 'package:dio/dio.dart';
import 'util.dart';
import '../api/util_api.dart';

class UtilServiceImpl implements UtilService {
  final Dio dio;
  final String baseUrl;

  UtilServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> isAddress({required String address}) {
    return isAddressApi(dio, baseUrl, address);
  }

  @override
  Future<Map<String, dynamic>> getTransactionCount({required String address}) {
    return getTransactionCountApi(dio, baseUrl, address);
  }
}
