import 'network.dart';

/// SDK configuration singleton for managing network settings and base URLs
class SDKConfig {
  static SDKConfig? _instance;

  Network _network = Network.mainnet;
  String? _customBaseUrl;
  String? _customConnectWUrl;

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
  void initialize({
    Network? network,
    String? customBaseUrl,
    String? customConnectWUrl,
  }) {
    if (network != null) {
      _network = network;
    }
    _customBaseUrl = customBaseUrl;
    _customConnectWUrl = customConnectWUrl;
  }

  /// Get the base URL based on current network configuration
  String getBaseURL() {
    if (_customBaseUrl != null) {
      return _customBaseUrl!;
    }

    switch (_network) {
      case Network.mainnet:
        return 'https://www.toronet.org';
      case Network.testnet:
        return 'https://testnet.toronet.org';
    }
  }

  /// Get the ConnectW URL for payment operations
  String getConnectWURL() {
    if (_customConnectWUrl != null) {
      return _customConnectWUrl!;
    }
    return 'https://payments.connectw.com';
  }

  /// Get the current network
  Network getNetwork() => _network;

  /// Set the network
  void setNetwork(Network network) {
    _network = network;
  }
}
