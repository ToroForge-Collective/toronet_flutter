/// Smart contract interaction service interface
///
/// Provides operations for:
/// - Signing messages with a Toronet wallet key
/// - Recovering the signer of a signed message
/// - Calling functions on deployed Toronet smart contracts
abstract class ContractService {
  /// Sign a message using the specified wallet's private key.
  Future<Map<String, dynamic>> signMessage({
    required String address,
    required String password,
    required String message,
  });

  /// Recover the signer address from a message and its signature.
  Future<Map<String, dynamic>> getMessageSigner({
    required String message,
    required String signedMessage,
  });

  /// Call a function on a deployed Toronet smart contract.
  ///
  /// By default the SDK handles encoding automatically:
  /// - [functionArguments] are pipe-joined and URI-encoded
  /// - [abi] is JSON-stringified and URI-encoded
  ///
  /// To pass pre-encoded values, use [rawFunctionArguments] and/or [rawAbi].
  Future<Map<String, dynamic>> callContractFunction({
    required String address,
    required String password,
    required String contractAddress,
    required String functionName,
    List<String> functionArguments,
    List<Map<String, dynamic>> abi,
    String? rawFunctionArguments,
    String? rawAbi,
  });
}
