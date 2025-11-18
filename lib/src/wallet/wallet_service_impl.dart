import 'package:dio/dio.dart';
import 'wallet.dart';
import '../api/wallet_api.dart';

class WalletServiceImpl implements WalletService {
  final Dio dio;
  final String baseUrl;

  WalletServiceImpl({required this.dio, required this.baseUrl});

  /// Create a wallet with username and password.
  /// Checks username availability, creates the wallet, and sets the username (TNS).
  @override
  Future<Wallet> createWallet({
    required String username,
    required String password,
  }) async {
    if (username.isEmpty || password.isEmpty) {
      throw Exception('Username and Password are required');
    }
    final isAvailable = await isTNSAvailable(username: username);
    if (!isAvailable) {
      throw Exception('Username is already taken');
    }
    final keystoreResp = await createWalletApi(dio, baseUrl, password);
    final address = keystoreResp['address'] as String;
    await configureTNS(
      address: address,
      password: password,
      username: username,
    );
    return Wallet(address: address, tnsName: username);
  }

  /// Import a wallet using a private key and password.
  /// Returns a [Wallet] object with the imported address and optional TNS name.
  @override
  Future<Wallet> importWalletFromPrivateKey({
    required String privateKey,
    required String password,
  }) async {
    final response = await importWalletFromPrivateKeyApi(
      dio,
      baseUrl,
      privateKey,
      password,
    );
    return Wallet(address: response['address'], tnsName: response['tnsName']);
  }

  /// Verify the password for a given wallet address.
  /// Returns true if the password is correct, false otherwise.
  @override
  Future<bool> verifyWalletPassword({
    required String address,
    required String password,
  }) async {
    return verifyWalletPasswordApi(dio, baseUrl, address, password);
  }

  /// Get the wallet key for a given address.
  /// Returns the wallet key as a string.
  @override
  Future<Map<String, dynamic>> getWalletKey({
    required String address,
    required String password,
  }) async {
    return getWalletKeyApi(dio, baseUrl, address, password);
  }

  /// Check if a username (TNS) is available.
  @override
  Future<bool> isTNSAvailable({required String username}) async {
    if (username.isEmpty) {
      throw Exception('Username is required');
    }
    return isTNSAvailableApi(dio, baseUrl, username);
  }

  /// Configure TNS (set username for address).
  @override
  Future<void> configureTNS({
    required String address,
    required String password,
    required String username,
  }) async {
    if (address.isEmpty || password.isEmpty || username.isEmpty) {
      throw Exception('Address, password, and username are required');
    }
    await configureTNSApi(dio, baseUrl, address, password, username);
  }

  /// Update wallet password.
  @override
  Future<void> updateWalletPassword({
    required String address,
    required String oldPassword,
    required String newPassword,
  }) async {
    if (address.isEmpty || oldPassword.isEmpty || newPassword.isEmpty) {
      throw Exception('Address, old password, and new password are required');
    }
    await updateWalletPasswordApi(
      dio,
      baseUrl,
      address,
      oldPassword,
      newPassword,
    );
  }

  /// Delete wallet from server.
  @override
  Future<void> deleteWallet({
    required String address,
    required String password,
  }) async {
    if (address.isEmpty || password.isEmpty) {
      throw Exception('Address and password are required');
    }
    await deleteWalletApi(dio, baseUrl, address, password);
  }
}
