import 'package:dio/dio.dart';
import 'config/sdk_config.dart';
import 'config/network.dart';
import 'wallet/wallet_service_impl.dart';
import 'blockchain/blockchain_service_impl.dart';
import 'balance/balance_service_impl.dart';
import 'kyc/kyc_service_impl.dart';
import 'payments/payments_service_impl.dart';
import 'exchange/exchange_service_impl.dart';
import 'query/query_service_impl.dart';
import 'currency/currency_service_impl.dart';
import 'tns/tns_service_impl.dart';
import 'storage/storage_service_impl.dart';
import 'roles/roles_service_impl.dart';
import 'token/token_service_impl.dart';
import 'products/products_service_impl.dart';
import 'virtual/virtual_service_impl.dart';
import 'solana/solana_service_impl.dart';
import 'polygon/polygon_service_impl.dart';
import 'bsc/bsc_service_impl.dart';
import 'base/base_service_impl.dart';
import 'arbitrum/arbitrum_service_impl.dart';

/// Main entry point for the Toronet SDK.
///
/// Example usage:
/// ```dart
/// // Using network enum (recommended)
/// final sdk = ToronetSDK(network: Network.testnet);
///
/// // Using custom URLs (backward compatible)
/// final sdk = ToronetSDK(
///   baseUrl: 'https://www.toronet.org',
///   paymentsUrl: 'https://payments.connectw.com',
/// );
///
/// // Using network with custom URLs
/// final sdk = ToronetSDK(
///   network: Network.testnet,
///   customBaseUrl: 'https://custom.toronet.org',
/// );
/// ```
class ToronetSDK {
  /// Wallet management service (create, import, verify, get key)
  final WalletServiceImpl walletService;

  /// Blockchain queries (status, blocks, transactions)
  final BlockchainServiceImpl blockchainService;

  /// Token balance queries
  final BalanceServiceImpl balanceService;

  /// KYC verification service
  final KycServiceImpl kycService;

  /// Fiat deposit service (uses paymentsUrl)
  final PaymentsServiceImpl paymentsService;

  /// Exchange rate queries
  final ExchangeServiceImpl exchangeService;

  /// Query operations service (events, blocks, transactions, exchange rates, etc.)
  final QueryServiceImpl queryService;

  /// Currency operations service (dollar, naira, euro, pound, egp, ksh, zar, eth)
  final CurrencyServiceImpl currencyService;

  /// TNS (Toronet Naming System) service
  final TNSServiceImpl tnsService;

  /// Storage operations service
  final StorageServiceImpl storageService;

  /// Role management service (admin, superadmin, debugger)
  final RolesServiceImpl rolesService;

  /// Token operations service
  final TokenServiceImpl tokenService;

  /// Product management service
  final ProductsServiceImpl productsService;

  /// Virtual wallet operations service
  final VirtualServiceImpl virtualService;

  /// Solana blockchain service
  final SolanaServiceImpl solanaService;

  /// Polygon blockchain service
  final PolygonServiceImpl polygonService;

  /// BSC (Binance Smart Chain) blockchain service
  final BSCServiceImpl bscService;

  /// Base blockchain service
  final BaseServiceImpl baseService;

  /// Arbitrum blockchain service
  final ArbitrumServiceImpl arbitrumService;

  /// Initialize SDK with network configuration or custom URLs
  ///
  /// [network] - The network to use (mainnet or testnet). If provided, baseUrl and paymentsUrl are ignored unless customBaseUrl/customConnectWUrl are also provided.
  /// [baseUrl] - Custom base URL (backward compatible, defaults to mainnet if network not specified)
  /// [paymentsUrl] - Custom ConnectW payments URL (backward compatible)
  /// [customBaseUrl] - Override base URL even when network is specified
  /// [customConnectWUrl] - Override ConnectW URL even when network is specified
  /// [dio] - Optional Dio instance for HTTP requests
  ToronetSDK._({
    required this.walletService,
    required this.blockchainService,
    required this.balanceService,
    required this.kycService,
    required this.paymentsService,
    required this.exchangeService,
    required this.queryService,
    required this.currencyService,
    required this.tnsService,
    required this.storageService,
    required this.rolesService,
    required this.tokenService,
    required this.productsService,
    required this.virtualService,
    required this.solanaService,
    required this.polygonService,
    required this.bscService,
    required this.baseService,
    required this.arbitrumService,
  });

  factory ToronetSDK({
    Network? network,
    String? baseUrl,
    String? paymentsUrl,
    String? customBaseUrl,
    String? customConnectWUrl,
    Dio? dio,
  }) {
    // Initialize SDK config
    final config = SDKConfig.instance;
    if (network != null) {
      config.initialize(
        network: network,
        customBaseUrl: customBaseUrl ?? baseUrl,
        customConnectWUrl: customConnectWUrl ?? paymentsUrl,
      );
    } else if (baseUrl != null || paymentsUrl != null) {
      // Backward compatibility: if baseUrl/paymentsUrl provided, use them
      config.initialize(customBaseUrl: baseUrl, customConnectWUrl: paymentsUrl);
    }

    final finalBaseUrl = config.getBaseURL();
    final finalPaymentsUrl = config.getConnectWURL();
    final dioInstance = dio ?? Dio();

    return ToronetSDK._(
      walletService: WalletServiceImpl(dio: dioInstance, baseUrl: finalBaseUrl),
      blockchainService: BlockchainServiceImpl(
        dio: dioInstance,
        baseUrl: finalBaseUrl,
      ),
      balanceService: BalanceServiceImpl(
        dio: dioInstance,
        baseUrl: finalBaseUrl,
      ),
      kycService: KycServiceImpl(dio: dioInstance, baseUrl: finalBaseUrl),
      paymentsService: PaymentsServiceImpl(
        dio: dioInstance,
        baseUrl: finalPaymentsUrl,
      ),
      exchangeService: ExchangeServiceImpl(
        dio: dioInstance,
        baseUrl: finalBaseUrl,
      ),
      queryService: QueryServiceImpl(dio: dioInstance, baseUrl: finalBaseUrl),
      currencyService: CurrencyServiceImpl(
        dio: dioInstance,
        baseUrl: finalBaseUrl,
      ),
      tnsService: TNSServiceImpl(dio: dioInstance, baseUrl: finalBaseUrl),
      storageService: StorageServiceImpl(
        dio: dioInstance,
        baseUrl: finalBaseUrl,
      ),
      rolesService: RolesServiceImpl(dio: dioInstance, baseUrl: finalBaseUrl),
      tokenService: TokenServiceImpl(dio: dioInstance, baseUrl: finalBaseUrl),
      productsService: ProductsServiceImpl(
        dio: dioInstance,
        baseUrl: finalBaseUrl,
      ),
          virtualService: VirtualServiceImpl(
            dio: dioInstance,
            baseUrl: finalPaymentsUrl,
          ),
          solanaService: SolanaServiceImpl(
            dio: dioInstance,
            baseUrl: finalBaseUrl,
          ),
          polygonService: PolygonServiceImpl(
            dio: dioInstance,
            baseUrl: finalBaseUrl,
          ),
          bscService: BSCServiceImpl(
            dio: dioInstance,
            baseUrl: finalBaseUrl,
          ),
          baseService: BaseServiceImpl(
            dio: dioInstance,
            baseUrl: finalBaseUrl,
          ),
          arbitrumService: ArbitrumServiceImpl(
            dio: dioInstance,
            baseUrl: finalBaseUrl,
          ),
        );
      }
}
