import 'package:dio/dio.dart';

import 'deployer.dart';
import '../api/deployer_api.dart';
import '../config/network.dart';

class DeployerServiceImpl implements DeployerService {
  final Dio _dio;
  final String _deployerUrl;
  final Network _network;

  DeployerServiceImpl({
    required Dio dio,
    required String deployerUrl,
    required Network network,
  }) : _dio = dio,
       _deployerUrl = deployerUrl,
       _network = network;

  @override
  Future<Map<String, dynamic>> deployContract({
    required String owner,
    required List<dynamic> abi,
    required String bytecode,
    List<dynamic> constructorArgs = const [],
    String? token,
  }) => deployContractApi(
    dio: _dio,
    deployerUrl: _deployerUrl,
    network: _network,
    owner: owner,
    abi: abi,
    bytecode: bytecode,
    constructorArgs: constructorArgs,
    token: token,
  );
}
