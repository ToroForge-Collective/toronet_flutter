# Toronet Flutter SDK

A comprehensive Dart/Flutter SDK for interacting with the Toronet blockchain and related services. This package provides easy-to-use APIs for wallet management, blockchain operations, currency management, TNS (Toronet Naming System), roles, tokens, payments, products, and virtual wallets.

---

## Features

### Core Services
- **Wallet Management**: Create, import, verify, update password, delete wallets, and manage TNS (Toronet Naming System)
- **Balance Queries**: Fetch token balances for any address
- **Blockchain Data**: Get blockchain status, blocks, transactions, receipts, and events
- **KYC**: Perform and verify KYC for addresses
- **Payments**: Deposit funds, confirm deposits, withdrawals, bank verification, and transaction queries
- **Exchange Rates**: Get supported assets and their exchange rates

### Advanced Services
- **Query Service**: Comprehensive query operations including exchange rates, address roles, balances, blocks, transactions, receipts, and currency-specific transaction queries
- **Currency Service**: Operations for dollar, naira, euro, pound, EGP, KSH, ZAR, ETH (client, owner, admin operations)
- **TNS Service**: Toronet Naming System operations (query, client, owner, admin)
- **Roles Service**: Role management for admin, superadmin, and debugger roles
- **Token Service**: Token operations including metadata, balance, allowances, fees, supply, status, and enrollment
- **Products Service**: Product management operations
- **Virtual Wallet Service**: Virtual wallet creation, fetching, and transaction updates

### Configuration
- **Network Selection**: Easy switching between mainnet and testnet
- **Custom URLs**: Support for custom base URLs and ConnectW URLs
- **Error Handling**: Comprehensive custom exception classes

---

## Installation

### Add Dependency

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  toronet:
    path: ../  # For local development
    # or
    # toronet: ^<latest_version>  # When published to pub.dev
  dio: ^5.0.0
```

### Import

```dart
import 'package:toronet/toronet.dart';
```

---

## Getting Started

### Basic Usage

```dart
import 'package:toronet/toronet.dart';

// Initialize SDK with network selection
final sdk = ToronetSDK(network: Network.mainnet);

// Or use testnet
final sdk = ToronetSDK(network: Network.testnet);

// Or use custom URLs (backward compatible)
final sdk = ToronetSDK(
  baseUrl: 'https://www.toronet.org',
  paymentsUrl: 'https://payments.connectw.com',
);
```

---

## Usage Examples

### Wallet Management

```dart
// Create a wallet
final wallet = await sdk.walletService.createWallet(
  username: 'testuser',
  password: 'testpassword',
);

// Import wallet from private key
final importedWallet = await sdk.walletService.importWalletFromPrivateKey(
  privateKey: '0x...',
  password: 'password',
);

// Verify wallet password
final isValid = await sdk.walletService.verifyWalletPassword(
  address: wallet.address,
  password: 'testpassword',
);

// Update wallet password
await sdk.walletService.updateWalletPassword(
  address: wallet.address,
  oldPassword: 'oldpassword',
  newPassword: 'newpassword',
);

// Delete wallet
await sdk.walletService.deleteWallet(
  address: wallet.address,
  password: 'password',
);

// Check TNS availability
final isAvailable = await sdk.walletService.isTNSAvailable(
  username: 'myusername',
);

// Configure TNS
await sdk.walletService.configureTNS(
  address: wallet.address,
  password: 'password',
  username: 'myusername',
);
```

### Query Operations

```dart
// Get exchange rates
final rates = await sdk.queryService.getExchangeRates();

// Get address role
final role = await sdk.queryService.getAddrRole(addr: wallet.address);

// Get address balance (all currencies)
final balance = await sdk.queryService.getAddrBalance(addr: wallet.address);

// Get block by ID
final block = await sdk.queryService.getBlock(blockId: '500000');

// Get transaction by hash
final transaction = await sdk.queryService.getTransaction(
  hash: '0x...',
);

// Get receipt by hash
final receipt = await sdk.queryService.getReceipt(hash: '0x...');

// Get transactions by currency
final toroTxns = await sdk.queryService.getTransactionsToro(count: 10);
final dollarTxns = await sdk.queryService.getTransactionsDollar(count: 10);
final nairaTxns = await sdk.queryService.getTransactionsNaira(count: 10);
// ... and more currencies (euro, pound, egp, ksh, zar, eth)

// Get address transactions by currency
final addrToroTxns = await sdk.queryService.getAddrTransactionsToro(
  addr: wallet.address,
  count: 10,
);

// Get transactions by date range
final rangeTxns = await sdk.queryService.getTransactionsRange(
  startDate: '2024-01-01',
  endDate: '2024-12-31',
  count: 100,
);

// Get address transactions by date range with token filter
final addrRangeTxns = await sdk.queryService.getAddrTransactionsRange(
  addr: wallet.address,
  startDate: '2024-01-01',
  endDate: '2024-12-31',
  token: 'toro', // optional
  count: 100,
);
```

### Currency Operations

```dart
import 'package:toronet/toronet.dart';

// Get currency balance
final balance = await sdk.currencyService.getCurrencyBalance(
  currency: Currency.dollar,
  address: wallet.address,
);

// Get currency name and symbol
final name = await sdk.currencyService.getCurrencyName(
  currency: Currency.dollar,
);
final symbol = await sdk.currencyService.getCurrencySymbol(
  currency: Currency.dollar,
);

// Transfer currency (client operation)
final transfer = await sdk.currencyService.transferCurrency(
  currency: Currency.dollar,
  from: wallet.address,
  fromPassword: 'password',
  to: '0x...',
  amount: '100',
);

// Mint currency (owner operation)
final mint = await sdk.currencyService.mintCurrency(
  currency: Currency.dollar,
  owner: ownerAddress,
  ownerPassword: 'password',
  to: wallet.address,
  amount: '1000',
);

// Burn currency (owner operation)
final burn = await sdk.currencyService.burnCurrency(
  currency: Currency.dollar,
  owner: ownerAddress,
  ownerPassword: 'password',
  from: wallet.address,
  amount: '100',
);

// Freeze currency (admin operation)
final freeze = await sdk.currencyService.freezeCurrency(
  currency: Currency.dollar,
  admin: adminAddress,
  adminPassword: 'password',
  address: wallet.address,
);

// Get transaction fees
final feeFixed = await sdk.currencyService.getTransactionFeeFixed(
  currency: Currency.dollar,
);
final feePercentage = await sdk.currencyService.getTransactionFeePercentage(
  currency: Currency.dollar,
);
final fee = await sdk.currencyService.getTransactionFee(
  currency: Currency.dollar,
  amount: '100',
);
```

### TNS (Toronet Naming System) Operations

```dart
// Query operations
final name = await sdk.tnsService.getName(address: wallet.address);
final address = await sdk.tnsService.getAddress(name: 'myusername');
final isAssigned = await sdk.tnsService.isAddressAssigned(
  address: wallet.address,
);
final isSetOn = await sdk.tnsService.isSetOn();
final isUpdateOn = await sdk.tnsService.isUpdateOn();
final isDeleteOn = await sdk.tnsService.isDeleteOn();

// Client operations
await sdk.tnsService.updateName(
  address: wallet.address,
  password: 'password',
  name: 'newname',
);
await sdk.tnsService.deleteName(
  address: wallet.address,
  password: 'password',
);

// Owner operations
await sdk.tnsService.initTNS(
  owner: ownerAddress,
  ownerPassword: 'password',
);
await sdk.tnsService.setSetNameOn(
  owner: ownerAddress,
  ownerPassword: 'password',
);

// Admin operations
await sdk.tnsService.adminSetName(
  admin: adminAddress,
  adminPassword: 'password',
  address: wallet.address,
  name: 'adminname',
);
```

### Role Management

```dart
import 'package:toronet/toronet.dart';

// Query operations
final isAdmin = await sdk.rolesService.isRole(
  roleType: RoleType.admin,
  address: wallet.address,
);
final index = await sdk.rolesService.getRoleIndex(
  roleType: RoleType.admin,
  address: wallet.address,
);
final count = await sdk.rolesService.getNumberOfRole(
  roleType: RoleType.admin,
);
final roleByIndex = await sdk.rolesService.getRoleByIndex(
  roleType: RoleType.admin,
  index: 0,
);

// Owner/Admin operations
await sdk.rolesService.initRole(
  roleType: RoleType.admin,
  owner: ownerAddress,
  ownerPassword: 'password',
);
await sdk.rolesService.addRole(
  roleType: RoleType.admin,
  owner: ownerAddress,
  ownerPassword: 'password',
  address: wallet.address,
);
```

### Token Operations

```dart
// Metadata
final name = await sdk.tokenService.getTokenName(tokenType: 'toro');
final symbol = await sdk.tokenService.getTokenSymbol(tokenType: 'toro');
final decimal = await sdk.tokenService.getTokenDecimal(tokenType: 'toro');

// Balance
final balance = await sdk.tokenService.getTokenBalance(
  tokenType: 'toro',
  address: wallet.address,
);

// Allowances
final minAllowance = await sdk.tokenService.getMinimumAllowance(
  tokenType: 'toro',
);
final maxAllowance = await sdk.tokenService.getMaximumAllowance(
  tokenType: 'toro',
);
final allowance = await sdk.tokenService.getAllowance(
  tokenType: 'toro',
  owner: wallet.address,
  spender: '0x...',
);

// Status
final isEnrolled = await sdk.tokenService.isTokenEnrolled(
  tokenType: 'toro',
  address: wallet.address,
);
final isFrozen = await sdk.tokenService.isTokenFrozen(
  tokenType: 'toro',
  address: wallet.address,
);
final isTransferOn = await sdk.tokenService.isTransferOn(tokenType: 'toro');
```

### Payment Operations

```dart
// Deposit funds
final deposit = await sdk.paymentsService.depositFunds(
  userAddress: wallet.address,
  username: 'testuser',
  amount: '1000',
  currency: Currency.NGN,
  admin: adminAddress,
  adminpwd: 'password',
);

// Confirm deposit
final confirm = await sdk.paymentsService.confirmDeposit(
  currency: 'NGN',
  txid: 'transaction_id',
  paymentType: 'bank', // optional
  admin: adminAddress,
  adminpwd: 'password',
);

// Get bank lists
final usdBanks = await sdk.paymentsService.getBankListUSD();
final ngnBanks = await sdk.paymentsService.getBankListNGN();

// Record withdrawal
final withdrawal = await sdk.paymentsService.recordFiatWithdrawal(
  address: wallet.address,
  password: 'password',
  currency: 'USD',
  token: 'toro',
  payername: 'John Doe',
  payeremail: 'john@example.com',
  // ... other required fields
  admin: adminAddress,
  adminpwd: 'password',
);

// Verify bank account (NGN)
final verification = await sdk.paymentsService.verifyBankAccountNameNGN(
  destinationInstitutionCode: '000013',
  accountNumber: '0125226043',
  admin: adminAddress,
  adminpwd: 'password',
);

// Get transactions
final transaction = await sdk.paymentsService.getFiatTransactionByTxid(
  txid: 'txid',
  admin: adminAddress,
  adminpwd: 'password',
);

// Get transactions by date range
final transactions = await sdk.paymentsService.getFiatTransactionsAddressRange(
  address: wallet.address,
  startDate: '2024-01-01',
  endDate: '2024-12-31',
  admin: adminAddress,
  adminpwd: 'password',
);
```

### Virtual Wallet Operations

```dart
// Create virtual wallet
final virtualWallet = await sdk.virtualService.createVirtualWallet(
  address: wallet.address,
  payername: 'John Doe',
  currency: 'NGN',
  admin: adminAddress,
  adminPassword: 'password',
);

// Fetch virtual wallet by ID
final walletById = await sdk.virtualService.fetchVirtualWallet(
  virtualWalletId: 'wallet_id',
  admin: adminAddress,
  adminPassword: 'password',
);

// Fetch virtual wallet by address
final walletByAddr = await sdk.virtualService.fetchVirtualWalletByAddress(
  address: wallet.address,
  admin: adminAddress,
  adminPassword: 'password',
);

// Update virtual wallet transactions
await sdk.virtualService.updateVirtualWalletTransactions(
  walletAddress: wallet.address,
  admin: adminAddress,
  adminPassword: 'password',
);
```

### Product Operations

```dart
// Get project info
final projectInfo = await sdk.productsService.getProjectInfo();

// Get product
final product = await sdk.productsService.getProduct(productId: 'product_id');

// Record product
final recorded = await sdk.productsService.recordProduct(
  productData: {
    'name': 'Product Name',
    'description': 'Product Description',
    // ... other fields
  },
  admin: adminAddress,
  adminPassword: 'password',
);

// Update product
final updated = await sdk.productsService.updateProduct(
  productId: 'product_id',
  productData: {
    'name': 'Updated Name',
    // ... other fields
  },
  admin: adminAddress,
  adminPassword: 'password',
);
```

---

## Network Configuration

The SDK supports easy switching between mainnet and testnet:

```dart
// Use mainnet (default)
final sdk = ToronetSDK(network: Network.mainnet);

// Use testnet
final sdk = ToronetSDK(network: Network.testnet);

// Use network with custom URLs
final sdk = ToronetSDK(
  network: Network.testnet,
  customBaseUrl: 'https://custom.toronet.org',
  customConnectWUrl: 'https://custom.connectw.com',
);

// Backward compatible: use custom URLs directly
final sdk = ToronetSDK(
  baseUrl: 'https://www.toronet.org',
  paymentsUrl: 'https://payments.connectw.com',
);
```

---

## Error Handling

The SDK provides custom exception classes for better error handling:

```dart
import 'package:toronet/toronet.dart';

try {
  final wallet = await sdk.walletService.createWallet(
    username: 'testuser',
    password: 'password',
  );
} on APIException catch (e) {
  print('API Error: ${e.message}');
  print('Status Code: ${e.statusCode}');
} on NetworkException catch (e) {
  print('Network Error: ${e.message}');
} on ValidationException catch (e) {
  print('Validation Error: ${e.message}');
} on ToroSDKException catch (e) {
  print('SDK Error: ${e.message}');
}
```

### Exception Types

- `ToroSDKException`: Base exception for all SDK exceptions
- `NetworkException`: Network-related errors
- `APIException`: API error responses (includes status code and error data)
- `ValidationException`: Validation errors
- `AuthenticationException`: Authentication failures

---

## API Reference

### ToronetSDK

Main entry point providing access to all services:

- `walletService`: Wallet management operations
- `blockchainService`: Blockchain queries
- `balanceService`: Token balance queries
- `kycService`: KYC operations
- `paymentsService`: Payment operations
- `exchangeService`: Exchange rate queries
- `queryService`: Comprehensive query operations
- `currencyService`: Currency operations
- `tnsService`: TNS operations
- `rolesService`: Role management
- `tokenService`: Token operations
- `productsService`: Product management
- `virtualService`: Virtual wallet operations

### Supported Currencies

- `Currency.dollar`: US Dollar
- `Currency.naira`: Nigerian Naira
- `Currency.euro`: Euro
- `Currency.pound`: British Pound
- `Currency.egp`: Egyptian Pound
- `Currency.ksh`: Kenyan Shilling
- `Currency.zar`: South African Rand
- `Currency.eth`: Ethereum
- `Currency.toro`: Toro (native token)

### Role Types

- `RoleType.admin`: Admin role
- `RoleType.superadmin`: Super Admin role
- `RoleType.debugger`: Debugger role

---

## Contributing

Contributions are welcome! Please open issues or pull requests for bugs, features, or questions.

---

## License

[MIT](./LICENSE)

---

## More Information

- [Toronet Website](https://www.toronet.org)
- [Toroforge Collective Website](https://www.toroforgecollective.com)
- [Dart Packages](https://pub.dev/)
- [Flutter](https://flutter.dev/)
