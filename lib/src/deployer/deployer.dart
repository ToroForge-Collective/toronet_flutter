/// Smart contract deployment service interface
///
/// Deploys compiled contracts to the Toronet blockchain.
/// The target network (mainnet or testnet) is resolved automatically
/// from the SDK's [Network] configuration at initialisation time.
///
/// Mainnet deployments require an authorization [token] issued by the
/// Toronet team. Testnet deployments do not need a token.
abstract class DeployerService {
  /// Deploy a compiled smart contract to the configured network.
  ///
  /// - [owner]           Toronet wallet address that will own the contract
  /// - [abi]             Contract ABI as a native Dart list
  /// - [bytecode]        Compiled bytecode (hex string)
  /// - [constructorArgs] Constructor arguments (default: empty)
  /// - [token]           Authorization token — required for mainnet
  Future<Map<String, dynamic>> deployContract({
    required String owner,
    required List<dynamic> abi,
    required String bytecode,
    List<dynamic> constructorArgs,
    String? token,
  });
}
