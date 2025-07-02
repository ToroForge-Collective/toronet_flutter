import 'package:dio/dio.dart';
import 'kyc.dart';
import '../api/kyc_api.dart';

class KycServiceImpl implements KycService {
  final Dio dio;
  final String baseUrl;

  KycServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<bool> performKYCForCustomer(KycParams params) async {
    return performKYCForCustomerApi(dio, baseUrl, params);
  }

  @override
  Future<bool> isAddressKYCVerified({required String address}) async {
    return isAddressKYCVerifiedApi(dio, baseUrl, address);
  }
}
