import 'package:dio/dio.dart';
import 'avax.dart';
import '../api/avax_api.dart';

class AvaxServiceImpl implements AvaxService {
  final Dio dio;
  final String baseUrl;

  AvaxServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> updateProjectReserve({
    required String avaxAddress,
    required String admin,
    required String adminpwd,
  }) {
    return updateProjectAvaxReserveApi(
      dio: dio,
      baseUrl: baseUrl,
      avaxAddress: avaxAddress,
      admin: admin,
      adminpwd: adminpwd,
    );
  }

  @override
  Future<Map<String, dynamic>> updateMerchantReserve({
    required String avaxAddress,
    required String admin,
    required String adminpwd,
  }) {
    return updateMerchantAvaxReserveApi(
      dio: dio,
      baseUrl: baseUrl,
      avaxAddress: avaxAddress,
      admin: admin,
      adminpwd: adminpwd,
    );
  }
}
