import 'package:dio/dio.dart';
import 'wallet/wallet_service_impl.dart';
import 'blockchain/blockchain_service_impl.dart';
import 'balance/balance_service_impl.dart';
import 'kyc/kyc_service_impl.dart';
import 'payments/payments_service_impl.dart';
import 'exchange/exchange_service_impl.dart';

/// Main entry point for the Toronet SDK.
///
/// Example usage:
/// ```dart
/// final sdk = ToronetSDK(
///   baseUrl: 'https://www.toronet.org',
///   paymentsUrl: 'https://payments.connectw.com',
/// );
/// final wallet = await sdk.walletService.createWallet(username: 'user', password: 'pass');
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

  ToronetSDK({required String baseUrl, Dio? dio})
    : walletService = WalletServiceImpl(dio: dio ?? Dio(), baseUrl: baseUrl),
      blockchainService = BlockchainServiceImpl(
        dio: dio ?? Dio(),
        baseUrl: baseUrl,
      ),
      balanceService = BalanceServiceImpl(dio: dio ?? Dio(), baseUrl: baseUrl),
      kycService = KycServiceImpl(dio: dio ?? Dio(), baseUrl: baseUrl),
      paymentsService = PaymentsServiceImpl(
        dio: dio ?? Dio(),
        baseUrl: baseUrl,
      ),
      exchangeService = ExchangeServiceImpl(
        dio: dio ?? Dio(),
        baseUrl: baseUrl,
      );
}
