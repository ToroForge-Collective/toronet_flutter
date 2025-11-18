import 'package:dio/dio.dart';
import 'storage.dart';
import '../api/storage_api.dart';

class StorageServiceImpl implements StorageService {
  final Dio dio;
  final String baseUrl;

  StorageServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<bool> isStorageOn() {
    return isStorageOnApi(dio, baseUrl);
  }

  @override
  Future<Map<String, dynamic>> getStorageVersion() {
    return getStorageVersionApi(dio, baseUrl);
  }

  @override
  Future<bool> isContractRegistered({required String contractAddress}) {
    return isContractRegisteredApi(dio, baseUrl, contractAddress);
  }

  @override
  Future<bool> isOwner({required String address}) {
    return isStorageOwnerApi(dio, baseUrl, address);
  }

  @override
  Future<Map<String, dynamic>> getOwner() {
    return getStorageOwnerApi(dio, baseUrl);
  }

  @override
  Future<Map<String, dynamic>> setStorageOn({
    required String owner,
    required String ownerPassword,
  }) {
    return setStorageOnApi(dio, baseUrl, owner, ownerPassword);
  }

  @override
  Future<Map<String, dynamic>> setStorageOff({
    required String owner,
    required String ownerPassword,
  }) {
    return setStorageOffApi(dio, baseUrl, owner, ownerPassword);
  }

  @override
  Future<Map<String, dynamic>> registerContract({
    required String owner,
    required String ownerPassword,
    required String contractAddress,
  }) {
    return registerContractApi(
      dio,
      baseUrl,
      owner,
      ownerPassword,
      contractAddress,
    );
  }

  @override
  Future<Map<String, dynamic>> unregisterContract({
    required String owner,
    required String ownerPassword,
    required String contractAddress,
  }) {
    return unregisterContractApi(
      dio,
      baseUrl,
      owner,
      ownerPassword,
      contractAddress,
    );
  }

  @override
  Future<Map<String, dynamic>> increaseStorageVersion({
    required String owner,
    required String ownerPassword,
  }) {
    return increaseStorageVersionApi(dio, baseUrl, owner, ownerPassword);
  }

  @override
  Future<Map<String, dynamic>> decreaseStorageVersion({
    required String owner,
    required String ownerPassword,
  }) {
    return decreaseStorageVersionApi(dio, baseUrl, owner, ownerPassword);
  }

  @override
  Future<Map<String, dynamic>> setStorageVersion({
    required String owner,
    required String ownerPassword,
    required String version,
  }) {
    return setStorageVersionApi(dio, baseUrl, owner, ownerPassword, version);
  }

  @override
  Future<Map<String, dynamic>> transferOwnership({
    required String owner,
    required String ownerPassword,
    required String newOwner,
  }) {
    return transferStorageOwnershipApi(
      dio,
      baseUrl,
      owner,
      ownerPassword,
      newOwner,
    );
  }
}
