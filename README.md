<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Toronet SDK

A Dart/Flutter SDK for interacting with the Toronet blockchain and related services.  
This package provides easy-to-use APIs for wallet management, balances, blockchain data, KYC, payments, and exchange rates.

---

## Features

- **Wallet Management**: Create, import, verify, and manage wallets and usernames (TNS).
- **Balance Queries**: Fetch token balances for any address.
- **Blockchain Data**: Get blockchain status, latest block, blocks, and transactions.
- **KYC**: Perform and verify KYC for addresses.
- **Payments**: Deposit funds using fiat currencies.
- **Exchange Rates**: Get supported assets and their exchange rates.

---

## Getting Started

### 1. Add Dependency

If using locally (recommended for development):

```yaml
dependencies:
  toronet:
    path: ../
```

Or, if published to pub.dev:

```yaml
dependencies:
  toronet: ^<latest_version>
```

### 2. Import the SDK

```dart
import 'package:toronet/toronet.dart';
```

---

## Usage

Here's a quick example of how to use the main features of the SDK in a Flutter app:

```dart
import 'package:toronet/toronet.dart';

final sdk = ToronetSDK(
  baseUrl: 'https://www.toronet.org',
);

// Create a wallet
final wallet = await sdk.walletService.createWallet(
  username: 'testuser',
  password: 'testpassword',
);

// Get balance
final balance = await sdk.balanceService.getBalance(address: wallet.address);

// Get blockchain status
final status = await sdk.blockchainService.getBlockchainStatus();

// Perform KYC
final kycResult = await sdk.kycService.performKYCForCustomer(KycParams(
  firstName: 'John',
  middleName: 'A',
  lastName: 'Doe',
  bvn: '12345678901',
  currency: 'NGN',
  phoneNumber: '08012345678',
  dob: '1990-01-01',
  address: 'Lagos',
  admin: 'admin',
  adminpwd: 'adminpwd',
));

// Deposit funds
final deposit = await sdk.paymentsService.depositFunds(
  userAddress: wallet.address,
  username: 'testuser',
  amount: '1000',
  currency: Currency.NGN,
  admin: 'admin',
  adminpwd: 'adminpwd',
);

// Get exchange rates
final rates = await sdk.exchangeService.getSupportedAssetsExchangeRates();
```

> **See the [`/example`](./example) folder for a full Flutter demo app.**

---

## API Overview

- `ToronetSDK` – Main entry point, provides access to all services.
- `WalletService` – Wallet creation, import, verification, TNS.
- `BalanceService` – Token balance queries.
- `BlockchainService` – Blockchain status, blocks, transactions.
- `KycService` – KYC operations.
- `PaymentsService` – Fiat deposit.
- `ExchangeService` – Exchange rates.

---

## Contributing

Contributions are welcome!  
Please open issues or pull requests for bugs, features, or questions.

---

## License

[MIT](./LICENSE)

---

## More Information

- [Toronet Website](https://www.toronet.org)
- [Dart Packages](https://pub.dev/)
- [Flutter](https://flutter.dev/)
