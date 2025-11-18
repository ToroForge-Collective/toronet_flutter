import '../models/role_type.dart';

abstract class RolesService {
  // Query Operations
  Future<bool> isRole({required RoleType roleType, required String address});

  Future<Map<String, dynamic>> getRoleIndex({
    required RoleType roleType,
    required String address,
  });

  Future<Map<String, dynamic>> getNumberOfRole({required RoleType roleType});

  Future<Map<String, dynamic>> getRoleByIndex({
    required RoleType roleType,
    required int index,
  });

  // Owner/Admin Operations
  Future<Map<String, dynamic>> initRole({
    required RoleType roleType,
    required String owner,
    required String ownerPassword,
  });

  Future<Map<String, dynamic>> addRole({
    required RoleType roleType,
    required String owner,
    required String ownerPassword,
    required String address,
  });

  Future<Map<String, dynamic>> removeRole({
    required RoleType roleType,
    required String owner,
    required String ownerPassword,
    required String address,
  });

  Future<Map<String, dynamic>> removeAllRoles({
    required RoleType roleType,
    required String owner,
    required String ownerPassword,
  });
}
