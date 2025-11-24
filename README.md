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

### Multi-Chain Bridge Services
- **Solana Service**: Complete Solana blockchain integration including address creation, validation, transfers, bridge operations, balance queries, transaction queries, and payment operations
- **Polygon Service**: Polygon blockchain bridge, balance queries, transaction queries, and payment operations
- **BSC Service**: Binance Smart Chain bridge, balance queries, transaction queries, and payment operations
- **Base Service**: Base blockchain bridge, balance queries, transaction queries, and payment operations
- **Arbitrum Service**: Arbitrum blockchain bridge, balance queries, transaction queries, and payment operations

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

### Multi-Chain Bridge Operations

#### Solana Operations

```dart
// Create Solana address
final solAddress = await sdk.solanaService.createSolanaAddress(
  admin: adminAddress,
  adminpwd: 'password',
);

// Validate Solana address
final isValid = await sdk.solanaService.isValidSolanaAddress(
  address: '3uwR7HMDuK6dXwZAfx8jHwPcyXsYmFuHWJv3zvJxRE9w',
  admin: adminAddress,
  adminpwd: 'password',
);

// Create Toronet-linked Solana address
final toronetSolAddress = await sdk.solanaService.createToronetSolanaAddress(
  address: wallet.address,
  password: 'password',
);

// Generate virtual wallet for Solana
final solVirtualWallet = await sdk.solanaService.generateVirtualWallet(
  address: wallet.address,
  password: 'password',
  payername: 'John Doe',
  currency: 'USDTSOL', // or 'SOL'
  admin: adminAddress,
  adminpwd: 'password',
);

// Transfer native SOL
final transferResult = await sdk.solanaService.transferSolana(
  from: '3uwR7HMDuK6dXwZAfx8jHwPcyXsYmFuHWJv3zvJxRE9w',
  to: '2Ha5ETJGGahgeLpqhTiAYWhAtre1bAGaG47zTDPzJcP4',
  amount: '0.1',
  password: 'password',
  admin: adminAddress,
  adminpwd: 'password',
);

// Transfer SOL token (SPL token)
final tokenTransfer = await sdk.solanaService.transferSolToken(
  from: '3uwR7HMDuK6dXwZAfx8jHwPcyXsYmFuHWJv3zvJxRE9w',
  to: '2Ha5ETJGGahgeLpqhTiAYWhAtre1bAGaG47zTDPzJcP4',
  amount: '2.5',
  password: 'password',
  contractAddress: 'EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v',
  tokenName: 'USDC',
  useTokenAsFees: 'true',
  admin: adminAddress,
  adminpwd: 'password',
);

// Get SOL balance
final solBalance = await sdk.solanaService.getSolBalance(
  address: '3uwR7HMDuK6dXwZAfx8jHwPcyXsYmFuHWJv3zvJxRE9w',
  admin: adminAddress,
  adminpwd: 'password',
);

// Get token balance
final tokenBalance = await sdk.solanaService.getSolTokenBalance(
  address: '3uwR7HMDuK6dXwZAfx8jHwPcyXsYmFuHWJv3zvJxRE9w',
  contractAddress: 'EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v',
  admin: adminAddress,
  adminpwd: 'password',
);

// Get Solana transactions
final transactions = await sdk.solanaService.getSolTransactions(
  address: '3uwR7HMDuK6dXwZAfx8jHwPcyXsYmFuHWJv3zvJxRE9w',
  admin: adminAddress,
  adminpwd: 'password',
);

// Bridge token from Solana to Toronet
final bridgeResult = await sdk.solanaService.bridgeToken(
  from: wallet.address,
  password: 'password',
  contractAddress: 'EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v',
  tokenName: 'USDC',
  amount: '3',
  admin: adminAddress,
  adminpwd: 'password',
);

// Get bridge token fee
final bridgeFee = await sdk.solanaService.getBridgeTokenFee(
  contractAddress: 'EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v',
  amount: '4',
  admin: adminAddress,
  adminpwd: 'password',
);

// Initialize payment with Solana
final paymentInit = await sdk.solanaService.paymentInitialize(
  address: wallet.address,
  password: 'password',
  currency: 'SOL', // or 'USDCSOL'
  token: 'TORO',
  amount: '10.0',
  payername: 'John Doe',
  admin: adminAddress,
  adminpwd: 'password',
);

// Record fiat transaction for Solana
final recordResult = await sdk.solanaService.recordFiatTransaction(
  currency: 'SOL', // or 'USDCSOL'
  txid: 'transaction_id',
  admin: adminAddress,
  adminpwd: 'password',
);
```

#### Polygon Operations

```dart
// Bridge token from Polygon to Toronet
final bridgeResult = await sdk.polygonService.bridgeToken(
  from: wallet.address,
  password: 'password',
  contractAddress: '0x3c499c542cEF5E3811e1192ce70d8cC03d5c3359',
  tokenName: 'USDC',
  amount: '2',
  admin: adminAddress,
  adminpwd: 'password',
);

// Get Polygon balance
final balance = await sdk.polygonService.getBalance(
  address: wallet.address,
  admin: adminAddress,
  adminpwd: 'password',
);

// Get token balance
final tokenBalance = await sdk.polygonService.getTokenBalance(
  address: wallet.address,
  contractAddress: '0x3c499c542cEF5E3811e1192ce70d8cC03d5c3359',
  tokenName: 'USDC',
);

// Get transactions
final transactions = await sdk.polygonService.getTransactions(
  address: wallet.address,
  admin: adminAddress,
  adminpwd: 'password',
);

// Initialize payment with Polygon
final paymentInit = await sdk.polygonService.paymentInitialize(
  address: wallet.address,
  password: 'password',
  currency: 'USDCPOLY',
  token: 'TORO',
  amount: '2.0',
  payername: 'John Doe',
  admin: adminAddress,
  adminpwd: 'password',
);
```

#### BSC Operations

```dart
// Bridge token from BSC to Toronet
final bridgeResult = await sdk.bscService.bridgeToken(
  from: wallet.address,
  password: 'password',
  contractAddress: '0x55d398326f99059ff775485246999027b3197955',
  tokenName: 'USDT',
  amount: '2',
  admin: adminAddress,
  adminpwd: 'password',
);

// Get BSC balance
final balance = await sdk.bscService.getBalance(
  address: wallet.address,
  admin: adminAddress,
  adminpwd: 'password',
);

// Get token balance
final tokenBalance = await sdk.bscService.getTokenBalance(
  address: wallet.address,
  contractAddress: '0x55d398326f99059ff775485246999027b3197955',
  tokenName: 'USDT',
);

// Initialize payment with BSC
final paymentInit = await sdk.bscService.paymentInitialize(
  address: wallet.address,
  password: 'password',
  currency: 'USDTBSC',
  token: 'TORO',
  amount: '2.0',
  payername: 'John Doe',
  admin: adminAddress,
  adminpwd: 'password',
);
```

#### Base Operations

```dart
// Bridge token from Base to Toronet
final bridgeResult = await sdk.baseService.bridgeToken(
  from: wallet.address,
  password: 'password',
  contractAddress: '0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913',
  tokenName: 'USDC',
  amount: '2',
  admin: adminAddress,
  adminpwd: 'password',
);

// Get Base balance
final balance = await sdk.baseService.getBalance(
  address: wallet.address,
  admin: adminAddress,
  adminpwd: 'password',
);

// Initialize payment with Base
final paymentInit = await sdk.baseService.paymentInitialize(
  address: wallet.address,
  password: 'password',
  currency: 'USDCBASE',
  token: 'TORO',
  amount: '2.0',
  payername: 'John Doe',
  admin: adminAddress,
  adminpwd: 'password',
);
```

#### Arbitrum Operations

```dart
// Bridge token from Arbitrum to Toronet
final bridgeResult = await sdk.arbitrumService.bridgeToken(
  from: wallet.address,
  password: 'password',
  contractAddress: '0xaf88d065e77c8cC2239327C5EDb3A432268e5831',
  tokenName: 'USDC',
  amount: '2',
  admin: adminAddress,
  adminpwd: 'password',
);

// Get Arbitrum balance
final balance = await sdk.arbitrumService.getBalance(
  address: wallet.address,
  admin: adminAddress,
  adminpwd: 'password',
);

// Initialize payment with Arbitrum
final paymentInit = await sdk.arbitrumService.paymentInitialize(
  address: wallet.address,
  password: 'password',
  currency: 'USDCARB',
  token: 'TORO',
  amount: '2.0',
  payername: 'John Doe',
  admin: adminAddress,
  adminpwd: 'password',
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
- `solanaService`: Solana blockchain operations
- `polygonService`: Polygon blockchain operations
- `bscService`: BSC (Binance Smart Chain) blockchain operations
- `baseService`: Base blockchain operations
- `arbitrumService`: Arbitrum blockchain operations

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
