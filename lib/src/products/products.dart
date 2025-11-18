abstract class ProductsService {
  Future<Map<String, dynamic>> getProjectInfo();

  Future<Map<String, dynamic>> getProduct({required String productId});

  Future<Map<String, dynamic>> recordProduct({
    required Map<String, dynamic> productData,
    required String admin,
    required String adminPassword,
  });

  Future<Map<String, dynamic>> updateProduct({
    required String productId,
    required Map<String, dynamic> productData,
    required String admin,
    required String adminPassword,
  });
}
