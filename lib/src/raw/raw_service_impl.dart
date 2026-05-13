import 'package:dio/dio.dart';
import 'raw.dart';
import '../api/raw_api.dart';

class RawServiceImpl implements RawService {
  final Dio dio;
  final String baseUrl;

  RawServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> sendRawData({required String rawData}) {
    return sendRawDataApi(dio: dio, baseUrl: baseUrl, rawData: rawData);
  }
}
