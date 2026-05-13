import 'package:dio/dio.dart';

import '../config/network.dart';
import '../exceptions/toro_exceptions.dart';

/// Deploy a compiled smart contract to the Toronet network.
///
/// The deployment endpoint is derived from [deployerUrl] and [network]:
/// - Mainnet: `{deployerBaseUrl}/mainnet/toroforge-deploy`
/// - Testnet: `{deployerBaseUrl}/testnet/toroforge-deploy`
///
/// [owner]           - Toronet wallet address that will own the contract
/// [abi]             - Contract ABI as a native Dart list
/// [bytecode]        - Compiled contract bytecode (hex string)
/// [constructorArgs] - Constructor arguments passed at deployment
/// [token]           - Deployment authorization token (required for mainnet;
///                     obtain from the Toronet team)
Future<Map<String, dynamic>> deployContractApi({
  required Dio dio,
  required String deployerUrl,
  required Network network,
  required String owner,
  required List<dynamic> abi,
  required String bytecode,
  List<dynamic> constructorArgs = const [],
  String? token,
}) async {
  if (network == Network.mainnet && (token == null || token.isEmpty)) {
    throw ValidationException(
      'A deployment token is required for mainnet deployment. '
      'Obtain it from the Toronet team.',
    );
  }

  // Normalize the deployer URL to its base (strip trailing /mainnet or /testnet)
  final normalized = deployerUrl.replaceAll(RegExp(r'/(mainnet|testnet)$'), '');
  final networkSegment = network == Network.mainnet ? 'mainnet' : 'testnet';
  final url = '$normalized/$networkSegment/toroforge-deploy';

  final body = <String, dynamic>{
    'owner': owner,
    'constructorArgs': constructorArgs,
    'abi': abi,
    'bytecode': bytecode,
  };
  if (token != null && token.isNotEmpty) {
    body['token'] = token;
  }

  final response = await dio.post(
    url,
    data: body,
    options: Options(headers: {'Content-Type': 'application/json'}),
  );

  if (response.data is Map && response.data['result'] == false) {
    throw APIException(response.data['error'] ?? 'Deployment failed');
  }
  return response.data as Map<String, dynamic>;
}
