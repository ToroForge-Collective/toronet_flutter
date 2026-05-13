# Toronet Flutter SDK

A comprehensive Dart/Flutter SDK for interacting with the Toronet blockchain and related services. This package provides easy-to-use APIs for wallet management, blockchain operations, currency management, TNS (Toronet Naming System), roles, tokens, payments, products, virtual wallets, storage, authentication, smart contract interactions, contract deployment, and multi-chain bridge operations across Ethereum, Solana, Tron, Polygon, BSC, Base, Arbitrum, and Avalanche.

---

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Getting Started](#getting-started)
- [Usage Examples](#usage-examples)
  - [Wallet Management](#wallet-management)
  - [Query Operations](#query-operations)
  - [Currency Operations](#currency-operations)
  - [TNS Operations](#tns-toronet-naming-system-operations)
  - [Role Management](#role-management)
  - [Token Operations](#token-operations)
  - [Payment Operations](#payment-operations)
  - [Virtual Wallet Operations](#virtual-wallet-operations)
  - [Product Operations](#product-operations)
  - [Multi-Chain Bridge Operations](#multi-chain-bridge-operations)
    - [Solana](#solana-operations)
    - [Polygon](#polygon-operations)
    - [BSC](#bsc-operations)
    - [Base](#base-operations)
    - [Arbitrum](#arbitrum-operations)
    - [ETH](#eth-operations)
    - [AVAX](#avax-reserve-operations)
    - [Tron](#tron-trx-operations)
  - [Utility, Raw & Auth](#utility-raw--auth-operations)
  - [Storage](#storage-operations)
  - [Smart Contract Operations](#smart-contract-operations)
  - [Contract Deployment](#contract-deployment)
- [Network Configuration](#network-configuration)
- [Error Handling](#error-handling)
- [API Reference](#api-reference)

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
- **Polygon Service**: Polygon blockchain bridge, balance queries, transaction queries, payment operations, gas token transfers, and reserve management
- **BSC Service**: Binance Smart Chain bridge, balance queries, transaction queries, payment operations, gas token transfers, and reserve management
- **Base Service**: Base blockchain bridge, balance queries, transaction queries, payment operations, gas token transfers, and reserve management
- **Arbitrum Service**: Arbitrum blockchain bridge, balance queries, transaction queries, payment operations, gas token transfers, and reserve management
- **ETH Service**: Ethereum blockchain integration including bridge operations, balance queries, transaction queries, token transfers, payment operations, and reserve management
- **Tron Service**: Tron (TRX) blockchain integration including address validation, balance queries (standard and virtual), transaction queries, TRX and TRC-20 token transfers
- **AVAX Service**: Avalanche reserve management (update project and merchant reserves)

### Utility Services
- **Storage Service**: On-chain storage state management — register/unregister contracts, version control, ownership transfer
- **Util Service**: Address validation and transaction count queries
- **Raw Service**: Send raw transaction data to the Toronet blockchain
- **Auth Service**: Client authentication and token management
- **Contract Service**: Smart contract interactions — sign messages, recover message signers, call contract functions with automatic encoding
- **Deployer Service**: Deploy compiled smart contracts to Toronet mainnet or testnet via Toroforge

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
    # toronet: ^0.0.4  # When published to pub.dev
  dio: ^5.4.0
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

// Mainnet (default)
final sdk = ToronetSDK(network: Network.mainnet);

// Testnet
final testSdk = ToronetSDK(network: Network.testnet);

// Custom URLs (backward compatible)
final customSdk = ToronetSDK(
  baseUrl: 'https://www.toronet.org',
  paymentsUrl: 'https://payments.connectw.com',
);

// Network + custom URL overrides
final overrideSdk = ToronetSDK(
  network: Network.testnet,
  customBaseUrl: 'https://custom.toronet.org',
  customConnectWUrl: 'https://custom.connectw.com',
  customDeployerUrl: 'https://custom-deployer.toronet.org/api/mainnet',
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

// Bridge native MATIC to Toronet
await sdk.polygonService.bridgeGasToken(
  from: wallet.address,
  password: 'password',
  amount: '1.0',
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

// Transfer native MATIC
await sdk.polygonService.transferGasToken(
  from: wallet.address,
  to: '0x...',
  amount: '0.5',
  password: 'password',
  admin: adminAddress,
  adminpwd: 'password',
);

// Update project Polygon reserve
await sdk.polygonService.updateProjectReserve(
  polyAddress: wallet.address,
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

// Bridge native BNB to Toronet
await sdk.bscService.bridgeGasToken(
  from: wallet.address,
  password: 'password',
  amount: '0.05',
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

// Get latest BSC block
final block = await sdk.bscService.getLatestBlock(
  admin: adminAddress,
  adminpwd: 'password',
);

// Transfer native BNB
await sdk.bscService.transferGasToken(
  from: wallet.address,
  to: '0x...',
  amount: '0.01',
  password: 'password',
  admin: adminAddress,
  adminpwd: 'password',
);

// Transfer BEP-20 token
await sdk.bscService.transferToken(
  from: wallet.address,
  to: '0x...',
  amount: '5',
  password: 'password',
  contractAddress: '0x55d398326f99059ff775485246999027b3197955',
  tokenName: 'USDT',
  admin: adminAddress,
  adminpwd: 'password',
);

// Update project BSC reserve
await sdk.bscService.updateProjectReserve(
  bscAddress: wallet.address,
  admin: adminAddress,
  adminpwd: 'password',
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

// Bridge native ETH (on Base) to Toronet
await sdk.baseService.bridgeGasToken(
  from: wallet.address,
  password: 'password',
  amount: '0.01',
  admin: adminAddress,
  adminpwd: 'password',
);

// Get Base balance
final balance = await sdk.baseService.getBalance(
  address: wallet.address,
  admin: adminAddress,
  adminpwd: 'password',
);

// Transfer native ETH (on Base)
await sdk.baseService.transferGasToken(
  from: wallet.address,
  to: '0x...',
  amount: '0.01',
  password: 'password',
  admin: adminAddress,
  adminpwd: 'password',
);

// Update project Base reserve
await sdk.baseService.updateProjectReserve(
  baseAddress: wallet.address,
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

// Transfer gas token (ETH on Arbitrum)
final transfer = await sdk.arbitrumService.transferGasToken(
  from: wallet.address,
  to: '0x...',
  amount: '0.01',
  password: 'password',
  admin: adminAddress,
  adminpwd: 'password',
);

// Update project Arbitrum reserve
await sdk.arbitrumService.updateProjectReserve(
  arbAddress: wallet.address,
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

#### ETH Operations

```dart
// Get ETH balance
final balance = await sdk.ethService.getBalance(
  address: wallet.address,
  admin: adminAddress,
  adminpwd: 'password',
);

// Get ETH token balance
final tokenBalance = await sdk.ethService.getTokenBalance(
  address: wallet.address,
  contractAddress: '0xdac17f958d2ee523a2206206994597c13d831ec7',
  tokenName: 'USDT',
);

// Bridge token from Ethereum to Toronet
final bridgeResult = await sdk.ethService.bridgeToken(
  from: wallet.address,
  password: 'password',
  contractAddress: '0xdac17f958d2ee523a2206206994597c13d831ec7',
  tokenName: 'USDT',
  amount: '10',
  admin: adminAddress,
  adminpwd: 'password',
);

// Bridge native ETH to Toronet
final gasResult = await sdk.ethService.bridgeGasToken(
  from: wallet.address,
  password: 'password',
  amount: '0.05',
  admin: adminAddress,
  adminpwd: 'password',
);

// Transfer native ETH
await sdk.ethService.transferGasToken(
  from: wallet.address,
  to: '0x...',
  amount: '0.01',
  password: 'password',
  admin: adminAddress,
  adminpwd: 'password',
);

// Update project ETH reserve
await sdk.ethService.updateProjectReserve(
  ethAddress: wallet.address,
  admin: adminAddress,
  adminpwd: 'password',
);

// Initialize payment with Ethereum
final paymentInit = await sdk.ethService.paymentInitialize(
  address: wallet.address,
  password: 'password',
  currency: 'USDTETH',
  token: 'TORO',
  amount: '5.0',
  payername: 'John Doe',
  admin: adminAddress,
  adminpwd: 'password',
);
```

#### AVAX Reserve Operations

```dart
// Update project AVAX reserve
await sdk.avaxService.updateProjectReserve(
  avaxAddress: wallet.address,
  admin: adminAddress,
  adminpwd: 'password',
);

// Update merchant AVAX reserve
await sdk.avaxService.updateMerchantReserve(
  avaxAddress: wallet.address,
  admin: adminAddress,
  adminpwd: 'password',
);
```

#### Tron (TRX) Operations

```dart
// Validate a Tron address
final isValid = await sdk.tronService.isValidTronAddress(
  address: 'TBjkrvhLoh6v7KBuziZs5fL4NqpbCzgXdf',
  admin: adminAddress,
  adminpwd: 'password',
);

// Get TRX balance
final balance = await sdk.tronService.getBalance(
  address: 'TBjkrvhLoh6v7KBuziZs5fL4NqpbCzgXdf',
  admin: adminAddress,
  adminpwd: 'password',
);

// Get TRX balance for a virtual address
final virtualBalance = await sdk.tronService.getBalanceVirtualAddress(
  address: wallet.address,
  admin: adminAddress,
  adminpwd: 'password',
);

// Get TRC-20 token balance
final tokenBalance = await sdk.tronService.getTokenBalance(
  address: 'TYKRzh8s4jrYs5CtaX5UV2BNHcUMgeHC1U',
  contractAddress: 'TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t',
  tokenName: 'USDT',
  admin: adminAddress,
  adminpwd: 'password',
);

// Get TRX transactions
final transactions = await sdk.tronService.getTransactions(
  address: 'TYKRzh8s4jrYs5CtaX5UV2BNHcUMgeHC1U',
  admin: adminAddress,
  adminpwd: 'password',
);

// Transfer TRX
await sdk.tronService.transferTrx(
  from: 'TYKRzh8s4jrYs5CtaX5UV2BNHcUMgeHC1U',
  to: 'TBjkrvhLoh6v7KBuziZs5fL4NqpbCzgXdf',
  amount: '10',
  password: 'password',
  admin: adminAddress,
  adminpwd: 'password',
);

// Transfer TRC-20 token
await sdk.tronService.transferTrxToken(
  from: 'TYKRzh8s4jrYs5CtaX5UV2BNHcUMgeHC1U',
  to: 'TBjkrvhLoh6v7KBuziZs5fL4NqpbCzgXdf',
  amount: '5',
  password: 'password',
  contractAddress: 'TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t',
  tokenName: 'USDT',
  admin: adminAddress,
  adminpwd: 'password',
);

// Get TRC-20 token transactions
final tokenTxns = await sdk.tronService.getTokenTransactions(
  address: 'TYKRzh8s4jrYs5CtaX5UV2BNHcUMgeHC1U',
  contractAddress: 'TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t',
  tokenName: 'USDT',
  admin: adminAddress,
  adminpwd: 'password',
);

// Get latest Tron block
final block = await sdk.tronService.getLatestBlock(
  admin: adminAddress,
  adminpwd: 'password',
);

// Verify a Tron virtual address
final verifyResult = await sdk.tronService.verifyTronVirtualAddress(
  from: wallet.address,
  password: 'password',
  admin: adminAddress,
  adminpwd: 'password',
);
```

### Utility, Raw & Auth Operations

```dart
// Check if an address is valid
final isValid = await sdk.utilService.isAddress(address: wallet.address);

// Get transaction count for an address
final count = await sdk.utilService.getTransactionCount(address: wallet.address);

// Send raw transaction data
final rawResult = await sdk.rawService.sendRawData(rawData: '0x...');

// Get auth status for an address
final authStatus = await sdk.authService.getAuthStatus(address: wallet.address);

// Verify an auth token
final tokenValid = await sdk.authService.verifyAuthToken(token: 'existing_token');

// Authenticate a client
final authResult = await sdk.authService.authenticateClient(
  address: wallet.address,
  password: 'password',
);

// Refresh auth token
final refreshed = await sdk.authService.refreshAuthToken(
  address: wallet.address,
  token: 'existing_token',
);
```

### Storage Operations

```dart
// Check if storage is enabled
final isOn = await sdk.storageService.isStorageOn();

// Check if a contract is registered
final isRegistered = await sdk.storageService.isContractRegistered(
  contractAddress: '0x...',
);

// Get current storage version
final version = await sdk.storageService.getStorageVersion();

// Register a contract (owner operation)
await sdk.storageService.registerContract(
  owner: ownerAddress,
  ownerPassword: 'password',
  contractAddress: '0x...',
);

// Unregister a contract
await sdk.storageService.unregisterContract(
  owner: ownerAddress,
  ownerPassword: 'password',
  contractAddress: '0x...',
);

// Increase storage version
await sdk.storageService.increaseStorageVersion(
  owner: ownerAddress,
  ownerPassword: 'password',
);

// Transfer ownership
await sdk.storageService.transferOwnership(
  owner: ownerAddress,
  ownerPassword: 'password',
  newOwner: '0x...',
);
```

### Smart Contract Operations

```dart
// Sign a message with a wallet
final signed = await sdk.contractService.signMessage(
  address: wallet.address,
  password: 'password',
  message: 'Hello Toronet',
);

// Recover the signer of a signed message
final signer = await sdk.contractService.getMessageSigner(
  message: 'Hello Toronet',
  signedMessage: signed['data'],
);

// Call a contract function (SDK handles encoding automatically)
final result = await sdk.contractService.callContractFunction(
  address: wallet.address,
  password: 'password',
  contractAddress: '0xContractAddress',
  functionName: 'transfer',
  functionArguments: ['0xRecipient', '1000'],
  abi: [
    {
      'name': 'transfer',
      'type': 'function',
      'inputs': [
        {'name': 'to', 'type': 'address'},
        {'name': 'amount', 'type': 'uint256'},
      ],
      'outputs': [{'name': '', 'type': 'bool'}],
    },
  ],
);

// Call a contract function with pre-encoded arguments (override path)
final rawResult = await sdk.contractService.callContractFunction(
  address: wallet.address,
  password: 'password',
  contractAddress: '0xContractAddress',
  functionName: 'transfer',
  rawFunctionArguments: '0xRecipient%7C1000',  // pipe-joined + URI-encoded
  rawAbi: Uri.encodeComponent('[{"name":"transfer",...}]'),
);
```

### Contract Deployment

```dart
// Deploy to testnet (no token required)
final deployed = await sdk.deployerService.deployContract(
  owner: wallet.address,
  abi: [
    {
      'name': 'transfer',
      'type': 'function',
      'inputs': [
        {'name': 'to', 'type': 'address'},
        {'name': 'amount', 'type': 'uint256'},
      ],
    },
  ],
  bytecode: '0x608060405234801561001057600080fd...',
  constructorArgs: [],
);
print(deployed['contractAddress']);

// Deploy to mainnet (token required — obtain from Toronet/Toroforge team)
final deployedMain = await sdk.deployerService.deployContract(
  owner: wallet.address,
  abi: myAbi,
  bytecode: '0x...',
  constructorArgs: ['arg1', 42],
  token: 'your-toronet-deployer-token',
);
```

---

## Network Configuration

The SDK supports easy switching between mainnet and testnet:

```dart
// Mainnet (default) — base URL: https://api.toronet.org
final sdk = ToronetSDK(network: Network.mainnet);

// Testnet — base URL: https://testnet.toronet.org
final testSdk = ToronetSDK(network: Network.testnet);

// Network + custom URL overrides
final customSdk = ToronetSDK(
  network: Network.testnet,
  customBaseUrl: 'https://custom.toronet.org',
  customConnectWUrl: 'https://custom.connectw.com',
  customDeployerUrl: 'https://custom-deployer.toronet.org/api/mainnet',
);

// Backward compatible: provide URLs directly (uses mainnet defaults for anything not set)
final legacySdk = ToronetSDK(
  baseUrl: 'https://www.toronet.org',
  paymentsUrl: 'https://payments.connectw.com',
);

// Access configured URLs at runtime
final deployerEndpoint = sdk.deployerUrl;
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
- `storageService`: On-chain storage state management
- `solanaService`: Solana blockchain operations
- `polygonService`: Polygon blockchain operations
- `bscService`: BSC (Binance Smart Chain) blockchain operations
- `baseService`: Base blockchain operations
- `arbitrumService`: Arbitrum blockchain operations
- `ethService`: Ethereum blockchain operations
- `tronService`: Tron (TRX) blockchain operations
- `avaxService`: Avalanche reserve management
- `utilService`: Address validation and transaction count
- `rawService`: Send raw transaction data
- `authService`: Client authentication and token management
- `contractService`: Smart contract interactions (sign messages, recover signers, call functions)
- `deployerService`: Deploy compiled smart contracts to mainnet/testnet
- `deployerUrl`: Configured deployer endpoint URL (`String`)

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
