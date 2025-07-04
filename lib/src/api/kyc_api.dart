// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import '../kyc/kyc.dart';

const CONNECTW_URL = "https://payments.connectw.com";

Future<bool> performKYCForCustomerApi(
  Dio dio,
  String baseUrl,
  KycParams params,
) async {
  final String url = '$baseUrl/api/payment/toro/';
  final data = {
    'op': 'check_kyc',
    'params': [
      {'name': 'currency', 'value': params.currency},
      {'name': 'bvn', 'value': params.bvn},
      {'name': 'firstName', 'value': params.firstName},
      {'name': 'lastName', 'value': params.lastName},
      {'name': 'middleName', 'value': params.middleName},
      {'name': 'phoneNumber', 'value': params.phoneNumber},
      {'name': 'dob', 'value': params.dob},
      {'name': 'address', 'value': params.address},
    ],
  };

  final response = await dio.post(
    url,
    data: data,
    options: Options(
      headers: {
        'admin': params.admin,
        'adminpwd': params.adminpwd,
        'Content-Type': 'application/json',
      },
    ),
  );

  return response.data['result'] as bool;
}

Future<bool> isAddressKYCVerifiedApi(
  Dio dio,
  String baseUrl,
  String address,
) async {
  final String url = '$CONNECTW_URL/api/verified/check-kyc';
  final data = {'address': address};
  final response = await dio.post(url, data: data);
  //  print("Response: ${response.data}");

  // return {
  //   'verified': response.data['verified'],
  //   'provider': response.data['provider'],
  // };
  return response.data['verified'] as bool;
}
