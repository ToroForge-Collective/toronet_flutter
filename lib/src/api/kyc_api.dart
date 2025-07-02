import 'package:dio/dio.dart';
import '../kyc/kyc.dart';

Future<bool> performKYCForCustomerApi(
  Dio dio,
  String baseUrl,
  KycParams params,
) async {
  final response = await dio.post(
    '$baseUrl/kyc/perform',
    data: {
      'firstName': params.firstName,
      'middleName': params.middleName,
      'lastName': params.lastName,
      'bvn': params.bvn,
      'currency': params.currency,
      'phoneNumber': params.phoneNumber,
      'dob': params.dob,
      'address': params.address,
      'admin': params.admin,
      'adminpwd': params.adminpwd,
    },
  );
  return response.data['success'] as bool;
}

Future<bool> isAddressKYCVerifiedApi(
  Dio dio,
  String baseUrl,
  String address,
) async {
  final response = await dio.get(
    '$baseUrl/kyc/verified',
    queryParameters: {'address': address},
  );
  return response.data['verified'] as bool;
}
