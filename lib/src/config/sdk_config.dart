import 'network.dart';

const String defaultBaseUrl = 'https://api.toronet.org';
const String defaultConnectWUrl = 'https://payments.connectw.com';
const String defaultDeployerUrl = 'https://deployer.toronet.org/api/mainnet';

/// SDK configuration singleton for managing network settings and base URLs
class SDKConfig {
  static SDKConfig? _instance;

  Network _network = Network.mainnet;
  String? _customBaseUrl;
  String? _customConnectWUrl;
  String? _customDeployerUrl;

  /// Private constructor for singleton pattern
  SDKConfig._();

  /// Get the singleton instance
  static SDKConfig get instance {
    _instance ??= SDKConfig._();
    return _instance!;
  }

  /// Initialize SDK configuration
  ///
  /// [network] - The network to use (mainnet or testnet)
  /// [customBaseUrl] - Optional custom base URL override
  /// [customConnectWUrl] - Optional custom ConnectW URL override
  /// [customDeployerUrl] - Optional custom deployer URL override
  void initialize({
    Network? network,
    String? customBaseUrl,
    String? customConnectWUrl,
    String? customDeployerUrl,
  }) {
    if (network != null) {
      _network = network;
    }
    _customBaseUrl = customBaseUrl;
    _customConnectWUrl = customConnectWUrl;
    _customDeployerUrl = customDeployerUrl;
  }

  /// Get the base URL based on current network configuration
  String getBaseURL() {
    if (_customBaseUrl != null) {
      return _customBaseUrl!;
    }

    switch (_network) {
      case Network.mainnet:
        return defaultBaseUrl;
      case Network.testnet:
        return 'https://testnet.toronet.org';
    }
  }

  /// Get the ConnectW URL for payment operations
  String getConnectWURL() {
    if (_customConnectWUrl != null) {
      return _customConnectWUrl!;
    }
    return defaultConnectWUrl;
  }

  /// Get the deployer URL
  String getDeployerURL() {
    if (_customDeployerUrl != null) {
      return _customDeployerUrl!;
    }
    return defaultDeployerUrl;
  }

  /// Get the current network
  Network getNetwork() => _network;

  /// Set the network
  void setNetwork(Network network) {
    _network = network;
  }
}
