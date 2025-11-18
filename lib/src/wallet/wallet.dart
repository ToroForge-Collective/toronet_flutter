import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  final String address;
  final String? tnsName;

  const Wallet({required this.address, this.tnsName});

  @override
  List<Object?> get props => [address, tnsName];
}

abstract class WalletService {
  /// Create a wallet with username and password.
  /// Checks username availability, creates the wallet, and sets the username (TNS).
  Future<Wallet> createWallet({
    required String username,
    required String password,
  });

  /// Import a wallet using a private key and password.
  /// Returns a [Wallet] object with the imported address and optional TNS name.
  Future<Wallet> importWalletFromPrivateKey({
    required String privateKey,
    required String password,
  });

  /// Verify the password for a given wallet address.
  /// Returns true if the password is correct, false otherwise.
  Future<bool> verifyWalletPassword({
    required String address,
    required String password,
  });

  /// Get the wallet key for a given address.
  /// Returns the wallet key as a string.
  Future<Map<String, dynamic>> getWalletKey({
    required String address,
    required String password,
  });

  /// Check if a username (TNS) is available.
  Future<bool> isTNSAvailable({required String username});

  /// Configure TNS (set username for address).
  Future<void> configureTNS({
    required String address,
    required String password,
    required String username,
  });

  /// Update wallet password.
  Future<void> updateWalletPassword({
    required String address,
    required String oldPassword,
    required String newPassword,
  });

  /// Delete wallet from server.
  Future<void> deleteWallet({
    required String address,
    required String password,
  });
}
