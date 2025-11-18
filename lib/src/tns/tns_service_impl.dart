import 'package:dio/dio.dart';
import 'tns.dart';
import '../api/tns_api.dart';

class TNSServiceImpl implements TNSService {
  final Dio dio;
  final String baseUrl;

  TNSServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, dynamic>> getName({required String address}) {
    return getTNSNameApi(dio, baseUrl, address);
  }

  @override
  Future<Map<String, dynamic>> getAddress({required String name}) {
    return getTNSAddressApi(dio, baseUrl, name);
  }

  @override
  Future<bool> isAddressAssigned({required String address}) {
    return isTNSAddressAssignedApi(dio, baseUrl, address);
  }

  @override
  Future<bool> isSetOn() {
    return isTNSSetOnApi(dio, baseUrl);
  }

  @override
  Future<bool> isUpdateOn() {
    return isTNSUpdateOnApi(dio, baseUrl);
  }

  @override
  Future<bool> isDeleteOn() {
    return isTNSDeleteOnApi(dio, baseUrl);
  }

  @override
  Future<Map<String, dynamic>> updateName({
    required String address,
    required String password,
    required String name,
  }) {
    return updateTNSNameApi(dio, baseUrl, address, password, name);
  }

  @override
  Future<Map<String, dynamic>> deleteName({
    required String address,
    required String password,
  }) {
    return deleteTNSNameApi(dio, baseUrl, address, password);
  }

  @override
  Future<Map<String, dynamic>> initTNS({
    required String owner,
    required String ownerPassword,
  }) {
    return initTNSApi(dio, baseUrl, owner, ownerPassword);
  }

  @override
  Future<Map<String, dynamic>> setSetNameOn({
    required String owner,
    required String ownerPassword,
  }) {
    return setTNSSetNameOnApi(dio, baseUrl, owner, ownerPassword);
  }

  @override
  Future<Map<String, dynamic>> setSetNameOff({
    required String owner,
    required String ownerPassword,
  }) {
    return setTNSSetNameOffApi(dio, baseUrl, owner, ownerPassword);
  }

  @override
  Future<Map<String, dynamic>> setUpdateOn({
    required String owner,
    required String ownerPassword,
  }) {
    return setTNSUpdateOnApi(dio, baseUrl, owner, ownerPassword);
  }

  @override
  Future<Map<String, dynamic>> setUpdateOff({
    required String owner,
    required String ownerPassword,
  }) {
    return setTNSUpdateOffApi(dio, baseUrl, owner, ownerPassword);
  }

  @override
  Future<Map<String, dynamic>> setDeleteOn({
    required String owner,
    required String ownerPassword,
  }) {
    return setTNSDeleteOnApi(dio, baseUrl, owner, ownerPassword);
  }

  @override
  Future<Map<String, dynamic>> setDeleteOff({
    required String owner,
    required String ownerPassword,
  }) {
    return setTNSDeleteOffApi(dio, baseUrl, owner, ownerPassword);
  }

  @override
  Future<Map<String, dynamic>> adminSetName({
    required String admin,
    required String adminPassword,
    required String address,
    required String name,
  }) {
    return adminSetTNSNameApi(
      dio,
      baseUrl,
      admin,
      adminPassword,
      address,
      name,
    );
  }

  @override
  Future<Map<String, dynamic>> adminUpdateName({
    required String admin,
    required String adminPassword,
    required String address,
    required String name,
  }) {
    return adminUpdateTNSNameApi(
      dio,
      baseUrl,
      admin,
      adminPassword,
      address,
      name,
    );
  }

  @override
  Future<Map<String, dynamic>> adminDeleteName({
    required String admin,
    required String adminPassword,
    required String address,
  }) {
    return adminDeleteTNSNameApi(dio, baseUrl, admin, adminPassword, address);
  }
}
