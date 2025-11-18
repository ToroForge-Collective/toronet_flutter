abstract class TNSService {
  // Query Operations
  Future<Map<String, dynamic>> getName({required String address});

  Future<Map<String, dynamic>> getAddress({required String name});

  Future<bool> isAddressAssigned({required String address});

  Future<bool> isSetOn();

  Future<bool> isUpdateOn();

  Future<bool> isDeleteOn();

  // Client Operations
  Future<Map<String, dynamic>> updateName({
    required String address,
    required String password,
    required String name,
  });

  Future<Map<String, dynamic>> deleteName({
    required String address,
    required String password,
  });

  // Owner Operations
  Future<Map<String, dynamic>> initTNS({
    required String owner,
    required String ownerPassword,
  });

  Future<Map<String, dynamic>> setSetNameOn({
    required String owner,
    required String ownerPassword,
  });

  Future<Map<String, dynamic>> setSetNameOff({
    required String owner,
    required String ownerPassword,
  });

  Future<Map<String, dynamic>> setUpdateOn({
    required String owner,
    required String ownerPassword,
  });

  Future<Map<String, dynamic>> setUpdateOff({
    required String owner,
    required String ownerPassword,
  });

  Future<Map<String, dynamic>> setDeleteOn({
    required String owner,
    required String ownerPassword,
  });

  Future<Map<String, dynamic>> setDeleteOff({
    required String owner,
    required String ownerPassword,
  });

  // Admin Operations
  Future<Map<String, dynamic>> adminSetName({
    required String admin,
    required String adminPassword,
    required String address,
    required String name,
  });

  Future<Map<String, dynamic>> adminUpdateName({
    required String admin,
    required String adminPassword,
    required String address,
    required String name,
  });

  Future<Map<String, dynamic>> adminDeleteName({
    required String admin,
    required String adminPassword,
    required String address,
  });
}
