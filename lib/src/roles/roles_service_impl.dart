import 'package:dio/dio.dart';
import 'roles.dart';
import '../api/roles_api.dart';
import '../models/role_type.dart';

class RolesServiceImpl implements RolesService {
  final Dio dio;
  final String baseUrl;

  RolesServiceImpl({required this.dio, required this.baseUrl});

  @override
  Future<bool> isRole({required RoleType roleType, required String address}) {
    return isRoleApi(dio, baseUrl, roleType, address);
  }

  @override
  Future<Map<String, dynamic>> getRoleIndex({
    required RoleType roleType,
    required String address,
  }) {
    return getRoleIndexApi(dio, baseUrl, roleType, address);
  }

  @override
  Future<Map<String, dynamic>> getNumberOfRole({required RoleType roleType}) {
    return getNumberOfRoleApi(dio, baseUrl, roleType);
  }

  @override
  Future<Map<String, dynamic>> getRoleByIndex({
    required RoleType roleType,
    required int index,
  }) {
    return getRoleByIndexApi(dio, baseUrl, roleType, index);
  }

  @override
  Future<Map<String, dynamic>> initRole({
    required RoleType roleType,
    required String owner,
    required String ownerPassword,
  }) {
    return initRoleApi(dio, baseUrl, roleType, owner, ownerPassword);
  }

  @override
  Future<Map<String, dynamic>> addRole({
    required RoleType roleType,
    required String owner,
    required String ownerPassword,
    required String address,
  }) {
    return addRoleApi(dio, baseUrl, roleType, owner, ownerPassword, address);
  }

  @override
  Future<Map<String, dynamic>> removeRole({
    required RoleType roleType,
    required String owner,
    required String ownerPassword,
    required String address,
  }) {
    return removeRoleApi(dio, baseUrl, roleType, owner, ownerPassword, address);
  }

  @override
  Future<Map<String, dynamic>> removeAllRoles({
    required RoleType roleType,
    required String owner,
    required String ownerPassword,
  }) {
    return removeAllRolesApi(dio, baseUrl, roleType, owner, ownerPassword);
  }
}
