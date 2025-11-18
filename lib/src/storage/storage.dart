abstract class StorageService {
  // Query Operations
  Future<bool> isStorageOn();

  Future<Map<String, dynamic>> getStorageVersion();

  Future<bool> isContractRegistered({required String contractAddress});

  Future<bool> isOwner({required String address});

  Future<Map<String, dynamic>> getOwner();

  // Owner Operations
  Future<Map<String, dynamic>> setStorageOn({
    required String owner,
    required String ownerPassword,
  });

  Future<Map<String, dynamic>> setStorageOff({
    required String owner,
    required String ownerPassword,
  });

  Future<Map<String, dynamic>> registerContract({
    required String owner,
    required String ownerPassword,
    required String contractAddress,
  });

  Future<Map<String, dynamic>> unregisterContract({
    required String owner,
    required String ownerPassword,
    required String contractAddress,
  });

  Future<Map<String, dynamic>> increaseStorageVersion({
    required String owner,
    required String ownerPassword,
  });

  Future<Map<String, dynamic>> decreaseStorageVersion({
    required String owner,
    required String ownerPassword,
  });

  Future<Map<String, dynamic>> setStorageVersion({
    required String owner,
    required String ownerPassword,
    required String version,
  });

  Future<Map<String, dynamic>> transferOwnership({
    required String owner,
    required String ownerPassword,
    required String newOwner,
  });
}
