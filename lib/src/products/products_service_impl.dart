import 'package:dio/dio.dart';
import 'products.dart';
import '../api/products_api.dart';

class ProductsServiceImpl implements ProductsService {
  final Dio dio;
  final String baseUrl;

  ProductsServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> getProjectInfo() {
    return getProjectInfoApi(dio, baseUrl);
  }

  @override
  Future<Map<String, dynamic>> getProduct({required String productId}) {
    return getProductApi(dio, baseUrl, productId);
  }

  @override
  Future<Map<String, dynamic>> recordProduct({
    required Map<String, dynamic> productData,
    required String admin,
    required String adminPassword,
  }) {
    return recordProductApi(dio, baseUrl, productData, admin, adminPassword);
  }

  @override
  Future<Map<String, dynamic>> updateProduct({
    required String productId,
    required Map<String, dynamic> productData,
    required String admin,
    required String adminPassword,
  }) {
    return updateProductApi(
      dio,
      baseUrl,
      productId,
      productData,
      admin,
      adminPassword,
    );
  }
}
