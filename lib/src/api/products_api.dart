import 'package:dio/dio.dart';
import '../exceptions/toro_exceptions.dart';

Future<Map<String, dynamic>> getProjectInfoApi(Dio dio, String baseUrl) async {
  final url = '$baseUrl/api/product';
  final data = {'op': 'getprojectinfo', 'params': []};
  final response = await dio.request(
    url,
    data: data,
    options: Options(
      method: 'GET',
      headers: {'Content-Type': 'application/json'},
    ),
  );
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> getProductApi(
  Dio dio,
  String baseUrl,
  String productId,
) async {
  final url = '$baseUrl/api/product';
  final data = {
    'op': 'getproduct',
    'params': [
      {'name': 'id', 'value': productId},
    ],
  };
  final response = await dio.request(
    url,
    data: data,
    options: Options(
      method: 'GET',
      headers: {'Content-Type': 'application/json'},
    ),
  );
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> recordProductApi(
  Dio dio,
  String baseUrl,
  Map<String, dynamic> productData,
  String admin,
  String adminPassword,
) async {
  final url = '$baseUrl/api/product';
  final params = [
    ...productData.entries.map((e) => {
      'name': e.key,
      'value': e.value.toString(),
    })
  ];
  final data = {'op': 'recordproduct', 'params': params};
  final response = await dio.post(
    url,
    data: data,
    options: Options(
      headers: {
        'admin': admin,
        'adminpwd': adminPassword,
        'Content-Type': 'application/json',
      },
    ),
  );
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}

Future<Map<String, dynamic>> updateProductApi(
  Dio dio,
  String baseUrl,
  String productId,
  Map<String, dynamic> productData,
  String admin,
  String adminPassword,
) async {
  final url = '$baseUrl/api/product';
  final params = [
    {'name': 'id', 'value': productId},
    ...productData.entries.map((e) => {
      'name': e.key,
      'value': e.value.toString(),
    })
  ];
  final data = {'op': 'updateproduct', 'params': params};
  final response = await dio.post(
    url,
    data: data,
    options: Options(
      headers: {
        'admin': admin,
        'adminpwd': adminPassword,
        'Content-Type': 'application/json',
      },
    ),
  );
  if (response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Unknown error');
  }
  return response.data;
}
