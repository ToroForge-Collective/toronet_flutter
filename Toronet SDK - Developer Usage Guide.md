# Toronet SDK - Developer Usage Guide

## Table of Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Quick Start](#quick-start)
4. [SDK Initialization](#sdk-initialization)
5. [Network Configuration](#network-configuration)
6. [Core Services](#core-services)
7. [Advanced Services](#advanced-services)
8. [Multi-Chain Bridge Services](#multi-chain-bridge-services)
9. [Error Handling](#error-handling)
10. [Best Practices](#best-practices)
11. [Common Patterns](#common-patterns)
12. [Troubleshooting](#troubleshooting)

---

## Introduction

The Toronet Flutter SDK is a comprehensive Dart/Flutter package that provides easy-to-use APIs for interacting with the Toronet blockchain and related services. It supports wallet management, blockchain operations, currency management, TNS (Toronet Naming System), roles, tokens, payments, products, virtual wallets, and multi-chain bridge operations across Solana, Polygon, BSC (Binance Smart Chain), Base, and Arbitrum blockchains.

### Key Features

- **Wallet Management**: Create, import, verify, and manage wallets
- **Blockchain Operations**: Query blocks, transactions, receipts, and events
- **Currency Operations**: Support for multiple fiat and crypto currencies
- **TNS Integration**: Toronet Naming System for human-readable addresses
- **Token Management**: Token operations, balances, and metadata
- **Payment Processing**: Fiat deposits, withdrawals, and verification
- **Multi-Chain Bridge**: Bridge tokens across 5 external blockchains
- **Role Management**: Admin, superadmin, and debugger role operations
- **Product Management**: Product creation and management
- **Virtual Wallets**: Virtual wallet operations for various currencies

---

## Installation

### Add to pubspec.yaml

Add the Toronet SDK to your `pubspec.yaml` file:

```yaml
dependencies:
  toronet: ^0.0.3
  flutter:
    sdk: flutter
```

### Install Dependencies

Run the following command to install the package:

```bash
flutter pub get
```

### Import the SDK

In your Dart files, import the SDK:

```dart
import 'package:toronet/toronet.dart';
```

---

## Quick Start

### Basic Example

```dart
import 'package:toronet/toronet.dart';

void main() async {
  // Initialize SDK with testnet
  final sdk = ToronetSDK(network: Network.testnet);
  
  try {
    // Create a new wallet
    final wallet = await sdk.walletService.createWallet(
      username: 'myusername',
      password: 'securepassword123',
    );
    
    print('Wallet created: ${wallet.address}');
    print('TNS Name: ${wallet.tnsName}');
  } catch (e) {
    print('Error: $e');
  }
}
```

---

## SDK Initialization

The SDK can be initialized in multiple ways depending on your needs.

### Method 1: Using Network Enum (Recommended)

```dart
// Mainnet
final sdk = ToronetSDK(network: Network.mainnet);

// Testnet
final sdk = ToronetSDK(network: Network.testnet);
```

### Method 2: Using Custom URLs (Backward Compatible)

```dart
final sdk = ToronetSDK(
  baseUrl: 'https://www.toronet.org',
  paymentsUrl: 'https://payments.connectw.com',
);
```

### Method 3: Network with Custom URLs

```dart
final sdk = ToronetSDK(
  network: Network.testnet,
  customBaseUrl: 'https://custom.toronet.org',
  customConnectWUrl: 'https://custom-payments.connectw.com',
);
```

### Method 4: With Custom Dio Instance

```dart
import 'package:dio/dio.dart';

final dio = Dio();
dio.options.connectTimeout = Duration(seconds: 30);
dio.options.receiveTimeout = Duration(seconds: 30);

final sdk = ToronetSDK(
  network: Network.mainnet,
  dio: dio,
);
```

---

## Network Configuration

The SDK uses a singleton `SDKConfig` to manage network settings.

### Available Networks

- `Network.mainnet`: Production network (`https://www.toronet.org`)
- `Network.testnet`: Test network (`https://testnet.toronet.org`)

### Accessing Configuration

```dart
import 'package:toronet/toronet.dart';

// Get the singleton instance
final config = SDKConfig.instance;

// Get base URL
final baseUrl = config.getBaseURL();

// Get ConnectW payments URL
final paymentsUrl = config.getConnectWURL();

// Check current network
final network = config.network; // Network.mainnet or Network.testnet
```

### Switching Networks

```dart
// Initialize with a specific network
final sdk = ToronetSDK(network: Network.testnet);

// To switch networks, create a new SDK instance
final mainnetSdk = ToronetSDK(network: Network.mainnet);
```

---

## Core Services

### Wallet Service

The wallet service handles wallet creation, import, verification, and TNS management.

#### Create Wallet

```dart
final wallet = await sdk.walletService.createWallet(
  username: 'myusername',
  password: 'securepassword123',
);

print('Address: ${wallet.address}');
print('TNS Name: ${wallet.tnsName}');
```

#### Import Wallet from Private Key

```dart
final wallet = await sdk.walletService.importWalletFromPrivateKey(
  privateKey: '0x1234567890abcdef...',
  password: 'securepassword123',
);
```

#### Verify Wallet Password

```dart
final isValid = await sdk.walletService.verifyWalletPassword(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
);

if (isValid) {
  print('Password is correct');
} else {
  print('Invalid password');
}
```

#### Get Wallet Key

```dart
final keyData = await sdk.walletService.getWalletKey(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
);

print('Wallet key: ${keyData['key']}');
```

#### Check TNS Availability

```dart
final isAvailable = await sdk.walletService.isTNSAvailable(
  username: 'myusername',
);

if (isAvailable) {
  print('Username is available');
}
```

#### Configure TNS

```dart
await sdk.walletService.configureTNS(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  username: 'myusername',
);
```

#### Update Wallet Password

```dart
await sdk.walletService.updateWalletPassword(
  address: '0x1234567890abcdef...',
  oldPassword: 'oldpassword123',
  newPassword: 'newpassword456',
);
```

#### Delete Wallet

```dart
await sdk.walletService.deleteWallet(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
);
```

---

### Blockchain Service

Query blockchain status, blocks, transactions, and receipts.

#### Get Blockchain Status

```dart
final status = await sdk.blockchainService.getStatus();
print('Latest block: ${status['latestBlock']}');
print('Network: ${status['network']}');
```

#### Get Block by Number

```dart
final block = await sdk.blockchainService.getBlockByNumber(
  blockNumber: 12345,
);
print('Block hash: ${block['hash']}');
```

#### Get Transaction by Hash

```dart
final transaction = await sdk.blockchainService.getTransactionByHash(
  txHash: '0x1234567890abcdef...',
);
print('From: ${transaction['from']}');
print('To: ${transaction['to']}');
print('Value: ${transaction['value']}');
```

#### Get Receipt by Hash

```dart
final receipt = await sdk.blockchainService.getReceiptByHash(
  txHash: '0x1234567890abcdef...',
);
print('Status: ${receipt['status']}');
print('Gas used: ${receipt['gasUsed']}');
```

---

### Balance Service

Query token balances for addresses.

#### Get Token Balance

```dart
final balance = await sdk.balanceService.getBalance(
  address: '0x1234567890abcdef...',
  tokenAddress: '0xabcdef1234567890...',
);

print('Balance: ${balance['balance']}');
print('Token: ${balance['token']}');
```

---

### KYC Service

Perform and verify KYC for addresses.

#### Perform KYC

```dart
final kycResult = await sdk.kycService.performKYC(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  firstName: 'John',
  lastName: 'Doe',
  email: 'john.doe@example.com',
  phone: '+1234567890',
  country: 'US',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

print('KYC Status: ${kycResult['status']}');
```

#### Verify KYC

```dart
final verification = await sdk.kycService.verifyKYC(
  address: '0x1234567890abcdef...',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

print('Verified: ${verification['verified']}');
```

---

### Payments Service

Handle fiat deposits, withdrawals, and payment operations.

#### Deposit Funds

```dart
final deposit = await sdk.paymentsService.depositFunds(
  userAddress: '0x1234567890abcdef...',
  username: 'myusername',
  amount: '100.00',
  currency: Currency.USD,
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

print('Deposit ID: ${deposit['depositId']}');
print('Status: ${deposit['status']}');
```

#### Confirm Deposit

```dart
final confirmation = await sdk.paymentsService.confirmDeposit(
  currency: 'USD',
  txid: 'transaction_id',
  paymentType: 'bank_transfer',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

print('Confirmed: ${confirmation['confirmed']}');
```

#### Get Bank Lists

```dart
// Get USD bank list
final usdBanks = await sdk.paymentsService.getBankListUSD();

// Get NGN bank list
final ngnBanks = await sdk.paymentsService.getBankListNGN();
```

#### Record Fiat Withdrawal

```dart
final withdrawal = await sdk.paymentsService.recordFiatWithdrawal(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  currency: 'USD',
  token: 'USDT',
  payername: 'John Doe',
  payeremail: 'john.doe@example.com',
  payeraddress: '123 Main St',
  payercity: 'New York',
  payerstate: 'NY',
  payercountry: 'US',
  payerzipcode: '10001',
  payerphone: '+1234567890',
  description: 'Withdrawal request',
  amount: '100.00',
  accounttype: 'checking',
  bankname: 'Bank Name',
  routingno: '123456789',
  accountno: '987654321',
  accountname: 'John Doe',
  recipientstate: 'NY',
  recipientzip: '10001',
  recipientphone: '+1234567890',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

print('Withdrawal ID: ${withdrawal['withdrawalId']}');
```

#### Verify Bank Account

```dart
final verification = await sdk.paymentsService.verifyBankAccount(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  currency: 'USD',
  accounttype: 'checking',
  bankname: 'Bank Name',
  routingno: '123456789',
  accountno: '987654321',
  accountname: 'John Doe',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

print('Verified: ${verification['verified']}');
```

#### Query Transactions

```dart
final transactions = await sdk.paymentsService.queryTransactions(
  address: '0x1234567890abcdef...',
  currency: 'USD',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

for (var tx in transactions) {
  print('Transaction: ${tx['txid']}');
  print('Amount: ${tx['amount']}');
  print('Status: ${tx['status']}');
}
```

---

### Exchange Service

Get exchange rates and supported assets.

#### Get Exchange Rates

```dart
final rates = await sdk.exchangeService.getExchangeRates();
print('USD Rate: ${rates['USD']}');
print('EUR Rate: ${rates['EUR']}');
```

#### Get Supported Assets

```dart
final assets = await sdk.exchangeService.getSupportedAssets();
for (var asset in assets) {
  print('Asset: ${asset['symbol']}');
  print('Rate: ${asset['rate']}');
}
```

---

### Query Service

Comprehensive query operations for blockchain data.

#### Get Exchange Rates

```dart
final rates = await sdk.queryService.getExchangeRates();
```

#### Get Address Role

```dart
final role = await sdk.queryService.getAddressRole(
  address: '0x1234567890abcdef...',
);
print('Role: ${role['role']}');
```

#### Get Address Balance

```dart
final balance = await sdk.queryService.getAddressBalance(
  address: '0x1234567890abcdef...',
);
print('Balance: ${balance['balance']}');
```

#### Get Block by ID

```dart
final block = await sdk.queryService.getBlockById(
  blockId: 'block_id_123',
);
```

#### Get Transaction by ID

```dart
final transaction = await sdk.queryService.getTransactionById(
  txId: 'tx_id_123',
);
```

#### Get Receipt by ID

```dart
final receipt = await sdk.queryService.getReceiptById(
  receiptId: 'receipt_id_123',
);
```

#### Get Currency Transactions

```dart
// Get dollar transactions
final dollarTxs = await sdk.queryService.getDollarTransactions(
  address: '0x1234567890abcdef...',
);

// Get naira transactions
final nairaTxs = await sdk.queryService.getNairaTransactions(
  address: '0x1234567890abcdef...',
);

// Get euro transactions
final euroTxs = await sdk.queryService.getEuroTransactions(
  address: '0x1234567890abcdef...',
);
```

#### Range Queries

```dart
// Get transactions in range
final transactions = await sdk.queryService.getTransactionsInRange(
  fromBlock: 1000,
  toBlock: 2000,
);

// Get events in range
final events = await sdk.queryService.getEventsInRange(
  fromBlock: 1000,
  toBlock: 2000,
);
```

---

## Advanced Services

### Currency Service

Operations for multiple currencies (dollar, naira, euro, pound, EGP, KSH, ZAR, ETH).

#### Client Operations

```dart
// Get dollar balance
final balance = await sdk.currencyService.getDollarBalance(
  address: '0x1234567890abcdef...',
);

// Transfer dollar
final transfer = await sdk.currencyService.transferDollar(
  from: '0x1234567890abcdef...',
  to: '0xabcdef1234567890...',
  amount: '100.00',
  password: 'securepassword123',
);
```

#### Owner Operations

```dart
// Mint dollar (owner only)
final mint = await sdk.currencyService.mintDollar(
  to: '0x1234567890abcdef...',
  amount: '1000.00',
  admin: 'owner_address',
  adminpwd: 'owner_password',
);

// Burn dollar (owner only)
final burn = await sdk.currencyService.burnDollar(
  from: '0x1234567890abcdef...',
  amount: '100.00',
  password: 'securepassword123',
  admin: 'owner_address',
  adminpwd: 'owner_password',
);
```

#### Admin Operations

```dart
// Get dollar total supply (admin only)
final supply = await sdk.currencyService.getDollarTotalSupply(
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
```

**Available Currency Operations:**
- Dollar: `getDollarBalance`, `transferDollar`, `mintDollar`, `burnDollar`, `getDollarTotalSupply`
- Naira: `getNairaBalance`, `transferNaira`, `mintNaira`, `burnNaira`, `getNairaTotalSupply`
- Euro: `getEuroBalance`, `transferEuro`, `mintEuro`, `burnEuro`, `getEuroTotalSupply`
- Pound: `getPoundBalance`, `transferPound`, `mintPound`, `burnPound`, `getPoundTotalSupply`
- EGP: `getEgpBalance`, `transferEgp`, `mintEgp`, `burnEgp`, `getEgpTotalSupply`
- KSH: `getKshBalance`, `transferKsh`, `mintKsh`, `burnKsh`, `getKshTotalSupply`
- ZAR: `getZarBalance`, `transferZar`, `mintZar`, `burnZar`, `getZarTotalSupply`
- ETH: `getEthBalance`, `transferEth`, `mintEth`, `burnEth`, `getEthTotalSupply`

---

### TNS Service

Toronet Naming System operations.

#### Query Operations

```dart
// Get TNS name for address
final tnsName = await sdk.tnsService.getTNSName(
  address: '0x1234567890abcdef...',
);
print('TNS Name: $tnsName');

// Get address for TNS name
final address = await sdk.tnsService.getTNSAddress(
  tnsName: 'myusername',
);
print('Address: $address');
```

#### Client Operations

```dart
// Set TNS name
await sdk.tnsService.setTNSName(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  tnsName: 'myusername',
);
```

#### Owner Operations

```dart
// Update TNS name (owner only)
await sdk.tnsService.updateTNSName(
  address: '0x1234567890abcdef...',
  newTnsName: 'newusername',
  admin: 'owner_address',
  adminpwd: 'owner_password',
);
```

#### Admin Operations

```dart
// Get all TNS names (admin only)
final allTns = await sdk.tnsService.getAllTNSNames(
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
```

---

### Roles Service

Role management for admin, superadmin, and debugger roles.

#### Admin Operations

```dart
// Assign admin role
await sdk.rolesService.assignAdminRole(
  address: '0x1234567890abcdef...',
  admin: 'superadmin_address',
  adminpwd: 'superadmin_password',
);

// Remove admin role
await sdk.rolesService.removeAdminRole(
  address: '0x1234567890abcdef...',
  admin: 'superadmin_address',
  adminpwd: 'superadmin_password',
);

// Check if address is admin
final isAdmin = await sdk.rolesService.isAdmin(
  address: '0x1234567890abcdef...',
);
```

#### Superadmin Operations

```dart
// Assign superadmin role
await sdk.rolesService.assignSuperadminRole(
  address: '0x1234567890abcdef...',
  admin: 'current_superadmin_address',
  adminpwd: 'current_superadmin_password',
);

// Remove superadmin role
await sdk.rolesService.removeSuperadminRole(
  address: '0x1234567890abcdef...',
  admin: 'current_superadmin_address',
  adminpwd: 'current_superadmin_password',
);
```

#### Debugger Operations

```dart
// Assign debugger role
await sdk.rolesService.assignDebuggerRole(
  address: '0x1234567890abcdef...',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

// Remove debugger role
await sdk.rolesService.removeDebuggerRole(
  address: '0x1234567890abcdef...',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
```

---

### Token Service

Token operations including metadata, balance, allowances, fees, supply, status, and enrollment.

#### Get Token Metadata

```dart
final metadata = await sdk.tokenService.getTokenMetadata(
  contractAddress: '0xabcdef1234567890...',
);
print('Name: ${metadata['name']}');
print('Symbol: ${metadata['symbol']}');
print('Decimals: ${metadata['decimals']}');
```

#### Get Token Balance

```dart
final balance = await sdk.tokenService.getTokenBalance(
  contractAddress: '0xabcdef1234567890...',
  address: '0x1234567890abcdef...',
);
print('Balance: ${balance['balance']}');
```

#### Get Token Allowance

```dart
final allowance = await sdk.tokenService.getTokenAllowance(
  contractAddress: '0xabcdef1234567890...',
  owner: '0x1234567890abcdef...',
  spender: '0xabcdef1234567890...',
);
print('Allowance: ${allowance['allowance']}');
```

#### Get Token Fees

```dart
final fees = await sdk.tokenService.getTokenFees(
  contractAddress: '0xabcdef1234567890...',
);
print('Transfer Fee: ${fees['transferFee']}');
print('Mint Fee: ${fees['mintFee']}');
```

#### Get Token Total Supply

```dart
final supply = await sdk.tokenService.getTokenTotalSupply(
  contractAddress: '0xabcdef1234567890...',
);
print('Total Supply: ${supply['totalSupply']}');
```

#### Get Token Status

```dart
final status = await sdk.tokenService.getTokenStatus(
  contractAddress: '0xabcdef1234567890...',
);
print('Status: ${status['status']}');
print('Is Active: ${status['isActive']}');
```

#### Check Token Enrollment

```dart
final isEnrolled = await sdk.tokenService.isTokenEnrolled(
  contractAddress: '0xabcdef1234567890...',
);
print('Enrolled: $isEnrolled');
```

---

### Products Service

Product management operations.

#### Get Project Info

```dart
final projectInfo = await sdk.productsService.getProjectInfo(
  projectId: 'project_123',
);
print('Project Name: ${projectInfo['name']}');
print('Description: ${projectInfo['description']}');
```

#### Get Product

```dart
final product = await sdk.productsService.getProduct(
  productId: 'product_123',
);
print('Product Name: ${product['name']}');
print('Price: ${product['price']}');
```

#### Record Product

```dart
final result = await sdk.productsService.recordProduct(
  projectId: 'project_123',
  productName: 'My Product',
  description: 'Product description',
  price: '100.00',
  currency: 'USD',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
print('Product ID: ${result['productId']}');
```

#### Update Product

```dart
await sdk.productsService.updateProduct(
  productId: 'product_123',
  productName: 'Updated Product Name',
  description: 'Updated description',
  price: '150.00',
  currency: 'USD',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
```

---

### Virtual Wallet Service

Virtual wallet operations for various currencies.

#### Create Virtual Wallet

```dart
final virtualWallet = await sdk.virtualService.createVirtualWallet(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  payername: 'John Doe',
  currency: 'USD',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
print('Virtual Wallet Address: ${virtualWallet['virtualAddress']}');
```

#### Get Virtual Wallet

```dart
final virtualWallet = await sdk.virtualService.getVirtualWallet(
  address: '0x1234567890abcdef...',
  currency: 'USD',
);
print('Virtual Address: ${virtualWallet['virtualAddress']}');
print('Balance: ${virtualWallet['balance']}');
```

#### Update Virtual Wallet Transaction

```dart
await sdk.virtualService.updateVirtualWalletTransaction(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  currency: 'USD',
  txid: 'transaction_id_123',
  amount: '100.00',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
```

---

## Multi-Chain Bridge Services

The SDK provides comprehensive support for bridging tokens and managing operations across 5 external blockchains: Solana, Polygon, BSC, Base, and Arbitrum.

### Solana Service

Complete Solana blockchain integration including address creation, validation, transfers, bridge operations, balance queries, transaction queries, and payment operations.

#### Address Operations

```dart
// Create a new Solana address
final solanaAddress = await sdk.solanaService.createSolanaAddress(
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
print('Solana Address: ${solanaAddress['address']}');

// Validate Solana address
final isValid = await sdk.solanaService.isValidSolanaAddress(
  address: 'SolanaAddress123...',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
print('Is Valid: ${isValid['valid']}');

// Create Toronet-linked Solana address
final toronetSolana = await sdk.solanaService.createToronetSolanaAddress(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
);
print('Toronet Solana Address: ${toronetSolana['solanaAddress']}');
```

#### Virtual Wallet Operations

```dart
// Generate virtual wallet for Solana
final virtualWallet = await sdk.solanaService.generateVirtualWallet(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  payername: 'John Doe',
  currency: 'USDTSOL', // or 'SOL'
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
print('Virtual Wallet: ${virtualWallet['virtualAddress']}');
```

#### Transfer Operations

```dart
// Transfer native SOL
final transfer = await sdk.solanaService.transferSolana(
  from: 'SolanaAddress123...',
  to: 'SolanaAddress456...',
  amount: '1.5',
  password: 'securepassword123',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
print('Transaction Hash: ${transfer['txHash']}');

// Transfer SOL token (SPL token)
final tokenTransfer = await sdk.solanaService.transferSolToken(
  from: 'SolanaAddress123...',
  to: 'SolanaAddress456...',
  amount: '100.0',
  password: 'securepassword123',
  contractAddress: 'TokenContractAddress...',
  tokenName: 'USDC',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
```

#### Balance Operations

```dart
// Get native SOL balance
final balance = await sdk.solanaService.getSolBalance(
  address: 'SolanaAddress123...',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
print('SOL Balance: ${balance['balance']}');

// Get token balance
final tokenBalance = await sdk.solanaService.getSolTokenBalance(
  address: 'SolanaAddress123...',
  contractAddress: 'TokenContractAddress...',
  tokenName: 'USDC',
);
print('Token Balance: ${tokenBalance['balance']}');
```

#### Transaction Operations

```dart
// Get transactions
final transactions = await sdk.solanaService.getSolTransactions(
  address: 'SolanaAddress123...',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

// Get token transactions
final tokenTransactions = await sdk.solanaService.getSolTokenTransactions(
  address: 'SolanaAddress123...',
  contractAddress: 'TokenContractAddress...',
  tokenName: 'USDC',
);

// Get latest block
final latestBlock = await sdk.solanaService.getSolLatestBlock(
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
print('Latest Block: ${latestBlock['blockNumber']}');
```

#### Bridge Operations

```dart
// Bridge token from Solana to Toronet
final bridge = await sdk.solanaService.bridgeToken(
  from: 'SolanaAddress123...',
  password: 'securepassword123',
  contractAddress: 'TokenContractAddress...',
  tokenName: 'USDC',
  amount: '100.0',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
print('Bridge Transaction: ${bridge['txHash']}');

// Get bridge token fee
final fee = await sdk.solanaService.getBridgeTokenFee(
  contractAddress: 'TokenContractAddress...',
  tokenName: 'USDC',
  amount: '100.0',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
print('Bridge Fee: ${fee['fee']}');
```

#### Reserve Operations

```dart
// Update merchant Solana reserve
await sdk.solanaService.updateMerchantSolReserve(
  merchantAddress: '0x1234567890abcdef...',
  amount: '1000.0',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

// Update project Solana reserve
await sdk.solanaService.updateProjectSolReserve(
  projectId: 'project_123',
  amount: '5000.0',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
```

#### Payment Operations

```dart
// Initialize payment with Solana
final payment = await sdk.solanaService.paymentInitialize(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  amount: '100.0',
  currency: 'SOL', // or 'USDCSOL'
  payername: 'John Doe',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
print('Payment ID: ${payment['paymentId']}');

// Record fiat transaction
await sdk.solanaService.recordFiatTransaction(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  currency: 'SOL',
  txid: 'transaction_id_123',
  amount: '100.0',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
```

---

### Polygon Service

Polygon blockchain bridge, balance queries, transaction queries, and payment operations.

#### Bridge Operations

```dart
// Bridge token from Polygon to Toronet
final bridge = await sdk.polygonService.bridgeToken(
  from: '0x1234567890abcdef...',
  password: 'securepassword123',
  contractAddress: '0xTokenContract...',
  tokenName: 'USDCPOLY',
  amount: '100.0',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
```

#### Balance Operations

```dart
// Get native MATIC balance
final balance = await sdk.polygonService.getBalance(
  address: '0x1234567890abcdef...',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

// Get token balance
final tokenBalance = await sdk.polygonService.getTokenBalance(
  address: '0x1234567890abcdef...',
  contractAddress: '0xTokenContract...',
  tokenName: 'USDCPOLY',
);
```

#### Transaction Operations

```dart
// Get transactions
final transactions = await sdk.polygonService.getTransactions(
  address: '0x1234567890abcdef...',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

// Get token transactions
final tokenTransactions = await sdk.polygonService.getTokenTransactions(
  address: '0x1234567890abcdef...',
  contractAddress: '0xTokenContract...',
  tokenName: 'USDCPOLY',
);
```

#### Payment Operations

```dart
// Initialize payment with Polygon
final payment = await sdk.polygonService.paymentInitialize(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  amount: '100.0',
  currency: 'USDCPOLY',
  payername: 'John Doe',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

// Record fiat transaction
await sdk.polygonService.recordFiatTransaction(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  currency: 'USDCPOLY',
  txid: 'transaction_id_123',
  amount: '100.0',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
```

---

### BSC Service

BSC (Binance Smart Chain) blockchain bridge, balance queries, transaction queries, and payment operations.

#### Bridge Operations

```dart
// Bridge token from BSC to Toronet
final bridge = await sdk.bscService.bridgeToken(
  from: '0x1234567890abcdef...',
  password: 'securepassword123',
  contractAddress: '0xTokenContract...',
  tokenName: 'USDTBSC',
  amount: '100.0',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
```

#### Balance Operations

```dart
// Get native BNB balance
final balance = await sdk.bscService.getBalance(
  address: '0x1234567890abcdef...',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

// Get token balance
final tokenBalance = await sdk.bscService.getTokenBalance(
  address: '0x1234567890abcdef...',
  contractAddress: '0xTokenContract...',
  tokenName: 'USDTBSC',
);
```

#### Transaction Operations

```dart
// Get transactions
final transactions = await sdk.bscService.getTransactions(
  address: '0x1234567890abcdef...',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

// Get token transactions
final tokenTransactions = await sdk.bscService.getTokenTransactions(
  address: '0x1234567890abcdef...',
  contractAddress: '0xTokenContract...',
  tokenName: 'USDTBSC',
);
```

#### Payment Operations

```dart
// Initialize payment with BSC
final payment = await sdk.bscService.paymentInitialize(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  amount: '100.0',
  currency: 'USDTBSC',
  payername: 'John Doe',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

// Record fiat transaction
await sdk.bscService.recordFiatTransaction(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  currency: 'USDTBSC',
  txid: 'transaction_id_123',
  amount: '100.0',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
```

---

### Base Service

Base blockchain bridge, balance queries, transaction queries, and payment operations.

#### Bridge Operations

```dart
// Bridge token from Base to Toronet
final bridge = await sdk.baseService.bridgeToken(
  from: '0x1234567890abcdef...',
  password: 'securepassword123',
  contractAddress: '0xTokenContract...',
  tokenName: 'USDCBASE',
  amount: '100.0',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
```

#### Balance Operations

```dart
// Get native ETH balance
final balance = await sdk.baseService.getBalance(
  address: '0x1234567890abcdef...',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

// Get token balance
final tokenBalance = await sdk.baseService.getTokenBalance(
  address: '0x1234567890abcdef...',
  contractAddress: '0xTokenContract...',
  tokenName: 'USDCBASE',
);
```

#### Transaction Operations

```dart
// Get transactions
final transactions = await sdk.baseService.getTransactions(
  address: '0x1234567890abcdef...',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

// Get token transactions
final tokenTransactions = await sdk.baseService.getTokenTransactions(
  address: '0x1234567890abcdef...',
  contractAddress: '0xTokenContract...',
  tokenName: 'USDCBASE',
);
```

#### Payment Operations

```dart
// Initialize payment with Base
final payment = await sdk.baseService.paymentInitialize(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  amount: '100.0',
  currency: 'USDCBASE',
  payername: 'John Doe',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

// Record fiat transaction
await sdk.baseService.recordFiatTransaction(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  currency: 'USDCBASE',
  txid: 'transaction_id_123',
  amount: '100.0',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
```

---

### Arbitrum Service

Arbitrum blockchain bridge, balance queries, transaction queries, and payment operations.

#### Bridge Operations

```dart
// Bridge token from Arbitrum to Toronet
final bridge = await sdk.arbitrumService.bridgeToken(
  from: '0x1234567890abcdef...',
  password: 'securepassword123',
  contractAddress: '0xTokenContract...',
  tokenName: 'USDCARB',
  amount: '100.0',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
```

#### Balance Operations

```dart
// Get native ETH balance
final balance = await sdk.arbitrumService.getBalance(
  address: '0x1234567890abcdef...',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

// Get token balance
final tokenBalance = await sdk.arbitrumService.getTokenBalance(
  address: '0x1234567890abcdef...',
  contractAddress: '0xTokenContract...',
  tokenName: 'USDCARB',
);
```

#### Transaction Operations

```dart
// Get transactions
final transactions = await sdk.arbitrumService.getTransactions(
  address: '0x1234567890abcdef...',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

// Get token transactions
final tokenTransactions = await sdk.arbitrumService.getTokenTransactions(
  address: '0x1234567890abcdef...',
  contractAddress: '0xTokenContract...',
  tokenName: 'USDCARB',
);
```

#### Payment Operations

```dart
// Initialize payment with Arbitrum
final payment = await sdk.arbitrumService.paymentInitialize(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  amount: '100.0',
  currency: 'USDCARB',
  payername: 'John Doe',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);

// Record fiat transaction
await sdk.arbitrumService.recordFiatTransaction(
  address: '0x1234567890abcdef...',
  password: 'securepassword123',
  currency: 'USDCARB',
  txid: 'transaction_id_123',
  amount: '100.0',
  admin: 'admin_address',
  adminpwd: 'admin_password',
);
```

---

## Error Handling

The SDK provides comprehensive error handling with custom exception classes.

### Exception Types

#### ToroSDKException

Base exception for all SDK exceptions.

```dart
try {
  await sdk.walletService.createWallet(
    username: 'myusername',
    password: 'password',
  );
} on ToroSDKException catch (e) {
  print('SDK Error: ${e.message}');
}
```

#### NetworkException

Network-related errors (connection timeouts, DNS failures, etc.).

```dart
try {
  final balance = await sdk.balanceService.getBalance(
    address: '0x123...',
    tokenAddress: '0xabc...',
  );
} on NetworkException catch (e) {
  print('Network Error: ${e.message}');
  print('Original Error: ${e.originalError}');
}
```

#### APIException

API error responses (includes status code and error data).

```dart
try {
  await sdk.walletService.createWallet(
    username: 'existingusername',
    password: 'password',
  );
} on APIException catch (e) {
  print('API Error: ${e.message}');
  print('Status Code: ${e.statusCode}');
  print('Error Data: ${e.errorData}');
}
```

#### ValidationException

Validation errors (invalid parameters, missing required fields, etc.).

```dart
try {
  await sdk.walletService.createWallet(
    username: '', // Invalid: empty username
    password: 'password',
  );
} on ValidationException catch (e) {
  print('Validation Error: ${e.message}');
}
```

#### AuthenticationException

Authentication failures (invalid credentials, expired tokens, etc.).

```dart
try {
  await sdk.walletService.verifyWalletPassword(
    address: '0x123...',
    password: 'wrongpassword',
  );
} on AuthenticationException catch (e) {
  print('Authentication Error: ${e.message}');
}
```

### Error Handling Best Practices

```dart
Future<void> handleWalletOperation() async {
  try {
    final wallet = await sdk.walletService.createWallet(
      username: 'myusername',
      password: 'securepassword123',
    );
    print('Success: ${wallet.address}');
  } on ValidationException catch (e) {
    // Handle validation errors
    print('Invalid input: ${e.message}');
  } on APIException catch (e) {
    // Handle API errors
    if (e.statusCode == 400) {
      print('Bad request: ${e.message}');
    } else if (e.statusCode == 401) {
      print('Unauthorized: ${e.message}');
    } else {
      print('API error: ${e.message}');
    }
  } on NetworkException catch (e) {
    // Handle network errors
    print('Network error: ${e.message}');
    // Retry logic can be implemented here
  } on ToroSDKException catch (e) {
    // Catch all other SDK exceptions
    print('SDK error: ${e.message}');
  } catch (e) {
    // Catch any unexpected errors
    print('Unexpected error: $e');
  }
}
```

---

## Best Practices

### 1. SDK Initialization

- **Use Network Enum**: Prefer using `Network.mainnet` or `Network.testnet` over hardcoded URLs.
- **Singleton Pattern**: The SDK uses a singleton `SDKConfig` for network management. Initialize once and reuse.
- **Custom Dio Instance**: For advanced use cases, provide a custom `Dio` instance with configured timeouts and interceptors.

```dart
// Good: Use network enum
final sdk = ToronetSDK(network: Network.testnet);

// Avoid: Hardcoded URLs (unless necessary)
final sdk = ToronetSDK(
  baseUrl: 'https://www.toronet.org',
  paymentsUrl: 'https://payments.connectw.com',
);
```

### 2. Error Handling

- **Always use try-catch**: Wrap SDK calls in try-catch blocks.
- **Specific Exception Types**: Catch specific exception types for better error handling.
- **User-Friendly Messages**: Translate technical error messages to user-friendly messages.

```dart
// Good: Specific exception handling
try {
  await sdk.walletService.createWallet(...);
} on ValidationException catch (e) {
  showError('Please check your input');
} on APIException catch (e) {
  showError('Service temporarily unavailable');
}

// Avoid: Generic catch
try {
  await sdk.walletService.createWallet(...);
} catch (e) {
  print(e); // Not user-friendly
}
```

### 3. Password Management

- **Never Store Passwords**: Never store passwords in plain text or shared preferences.
- **Use Secure Storage**: Use Flutter secure storage packages for sensitive data.
- **Password Validation**: Validate passwords on the client side before making API calls.

```dart
// Good: Use secure storage
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();
await storage.write(key: 'wallet_address', value: wallet.address);
// Never store password

// Avoid: Storing passwords
SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.setString('password', password); // NEVER DO THIS
```

### 4. Async/Await Patterns

- **Use async/await**: Prefer async/await over Future.then() for better readability.
- **Handle Loading States**: Show loading indicators during async operations.

```dart
// Good: Async/await with loading state
Future<void> createWallet() async {
  setState(() => isLoading = true);
  try {
    final wallet = await sdk.walletService.createWallet(...);
    setState(() {
      isLoading = false;
      walletAddress = wallet.address;
    });
  } catch (e) {
    setState(() => isLoading = false);
    showError(e.toString());
  }
}

// Avoid: Nested Future.then()
sdk.walletService.createWallet(...).then((wallet) {
  // Handle success
}).catchError((e) {
  // Handle error
});
```

### 5. Network Configuration

- **Testnet for Development**: Use testnet during development and testing.
- **Mainnet for Production**: Switch to mainnet only in production.
- **Environment Variables**: Use environment variables or configuration files for network selection.

```dart
// Good: Environment-based configuration
final network = const String.fromEnvironment('NETWORK', defaultValue: 'testnet');
final sdk = ToronetSDK(
  network: network == 'mainnet' ? Network.mainnet : Network.testnet,
);
```

### 6. Resource Management

- **Dispose Resources**: Properly dispose of SDK instances if needed (though SDK is stateless).
- **Connection Pooling**: The SDK uses Dio which handles connection pooling automatically.

### 7. Logging and Debugging

- **Log Important Operations**: Log wallet creation, transactions, and critical operations.
- **Debug Mode**: Use debug mode during development to see detailed error messages.

```dart
// Good: Logging important operations
void logWalletCreation(String address) {
  if (kDebugMode) {
    print('Wallet created: $address');
  }
  // In production, use a proper logging service
  logger.info('Wallet created', {'address': address});
}
```

---

## Common Patterns

### Pattern 1: Wallet Creation Flow

```dart
Future<Wallet?> createUserWallet(String username, String password) async {
  try {
    // Check username availability
    final isAvailable = await sdk.walletService.isTNSAvailable(
      username: username,
    );
    
    if (!isAvailable) {
      throw ValidationException('Username is already taken');
    }
    
    // Create wallet
    final wallet = await sdk.walletService.createWallet(
      username: username,
      password: password,
    );
    
    return wallet;
  } on ValidationException catch (e) {
    print('Validation error: ${e.message}');
    return null;
  } on APIException catch (e) {
    print('API error: ${e.message}');
    return null;
  }
}
```

### Pattern 2: Balance Checking with Retry

```dart
Future<Map<String, dynamic>?> getBalanceWithRetry(
  String address,
  String tokenAddress, {
  int maxRetries = 3,
}) async {
  for (int i = 0; i < maxRetries; i++) {
    try {
      final balance = await sdk.balanceService.getBalance(
        address: address,
        tokenAddress: tokenAddress,
      );
      return balance;
    } on NetworkException catch (e) {
      if (i == maxRetries - 1) {
        print('Failed after $maxRetries attempts: ${e.message}');
        return null;
      }
      await Future.delayed(Duration(seconds: 2 * (i + 1)));
    }
  }
  return null;
}
```

### Pattern 3: Transaction Monitoring

```dart
Future<void> monitorTransaction(String txHash) async {
  const maxAttempts = 30;
  const delay = Duration(seconds: 2);
  
  for (int i = 0; i < maxAttempts; i++) {
    try {
      final receipt = await sdk.blockchainService.getReceiptByHash(
        txHash: txHash,
      );
      
      if (receipt['status'] == 'confirmed') {
        print('Transaction confirmed!');
        return;
      }
      
      await Future.delayed(delay);
    } catch (e) {
      print('Error checking transaction: $e');
      await Future.delayed(delay);
    }
  }
  
  print('Transaction monitoring timeout');
}
```

### Pattern 4: Multi-Chain Balance Aggregation

```dart
Future<Map<String, double>> getAllBalances(String address) async {
  final balances = <String, double>{};
  
  try {
    // Toronet balance
    final toronetBalance = await sdk.balanceService.getBalance(
      address: address,
      tokenAddress: 'TORO_TOKEN_ADDRESS',
    );
    balances['TORO'] = double.parse(toronetBalance['balance'] ?? '0');
  } catch (e) {
    print('Error getting Toronet balance: $e');
  }
  
  try {
    // Solana balance
    final solBalance = await sdk.solanaService.getSolBalance(
      address: address,
      admin: 'admin_address',
      adminpwd: 'admin_password',
    );
    balances['SOL'] = double.parse(solBalance['balance'] ?? '0');
  } catch (e) {
    print('Error getting Solana balance: $e');
  }
  
  // Add other chains...
  
  return balances;
}
```

### Pattern 5: Bridge Token Flow

```dart
Future<Map<String, dynamic>?> bridgeTokenFlow({
  required String fromAddress,
  required String password,
  required String contractAddress,
  required String tokenName,
  required String amount,
  required String chain, // 'sol', 'poly', 'bsc', 'base', 'arb'
}) async {
  try {
    // Get bridge fee first
    final fee = await _getBridgeFee(chain, contractAddress, tokenName, amount);
    print('Bridge fee: ${fee['fee']}');
    
    // Perform bridge
    final bridgeResult = await _performBridge(
      chain,
      fromAddress,
      password,
      contractAddress,
      tokenName,
      amount,
    );
    
    // Monitor bridge transaction
    await monitorBridgeTransaction(bridgeResult['txHash']);
    
    return bridgeResult;
  } catch (e) {
    print('Bridge error: $e');
    return null;
  }
}

Future<Map<String, dynamic>> _getBridgeFee(
  String chain,
  String contractAddress,
  String tokenName,
  String amount,
) async {
  switch (chain) {
    case 'sol':
      return await sdk.solanaService.getBridgeTokenFee(
        contractAddress: contractAddress,
        tokenName: tokenName,
        amount: amount,
        admin: 'admin_address',
        adminpwd: 'admin_password',
      );
    case 'poly':
      return await sdk.polygonService.getBridgeTokenFee(
        contractAddress: contractAddress,
        tokenName: tokenName,
        amount: amount,
        admin: 'admin_address',
        adminpwd: 'admin_password',
      );
    // Add other chains...
    default:
      throw ValidationException('Unsupported chain: $chain');
  }
}
```

---

## Troubleshooting

### Common Issues and Solutions

#### Issue 1: Network Connection Errors

**Symptoms:**
- `NetworkException` with connection timeout
- DNS resolution failures

**Solutions:**
- Check internet connectivity
- Verify network URLs are correct
- Increase timeout values in Dio configuration
- Check firewall/proxy settings

```dart
final dio = Dio();
dio.options.connectTimeout = Duration(seconds: 60);
dio.options.receiveTimeout = Duration(seconds: 60);

final sdk = ToronetSDK(network: Network.mainnet, dio: dio);
```

#### Issue 2: Authentication Errors

**Symptoms:**
- `AuthenticationException` when verifying passwords
- `APIException` with 401 status code

**Solutions:**
- Verify password is correct
- Check if wallet exists
- Ensure admin credentials are correct for admin operations

```dart
// Verify password before operations
final isValid = await sdk.walletService.verifyWalletPassword(
  address: address,
  password: password,
);

if (!isValid) {
  throw AuthenticationException('Invalid password');
}
```

#### Issue 3: Validation Errors

**Symptoms:**
- `ValidationException` for empty or invalid parameters
- API returns 400 Bad Request

**Solutions:**
- Validate inputs before making API calls
- Check required parameters are provided
- Verify address formats are correct

```dart
// Validate before API call
if (username.isEmpty || username.length < 3) {
  throw ValidationException('Username must be at least 3 characters');
}

if (password.isEmpty || password.length < 8) {
  throw ValidationException('Password must be at least 8 characters');
}
```

#### Issue 4: TNS Username Already Taken

**Symptoms:**
- `APIException` when creating wallet with existing username

**Solutions:**
- Check username availability before creating wallet
- Provide alternative username suggestions

```dart
// Check availability first
final isAvailable = await sdk.walletService.isTNSAvailable(
  username: username,
);

if (!isAvailable) {
  throw ValidationException('Username is already taken');
}
```

#### Issue 5: Insufficient Balance

**Symptoms:**
- Transaction failures due to insufficient balance
- Bridge operations failing

**Solutions:**
- Check balance before transactions
- Account for gas fees
- Verify sufficient balance for bridge operations

```dart
// Check balance before transfer
final balance = await sdk.balanceService.getBalance(
  address: fromAddress,
  tokenAddress: tokenAddress,
);

final balanceAmount = double.parse(balance['balance'] ?? '0');
final transferAmount = double.parse(amount);
final gasFee = 0.001; // Estimated gas fee

if (balanceAmount < transferAmount + gasFee) {
  throw ValidationException('Insufficient balance');
}
```

#### Issue 6: Bridge Operation Failures

**Symptoms:**
- Bridge transactions failing
- Token not found errors

**Solutions:**
- Verify contract addresses are correct
- Check token names match supported tokens
- Ensure sufficient balance for bridge fee
- Verify admin credentials

```dart
// Verify contract address before bridge
final tokenMetadata = await sdk.tokenService.getTokenMetadata(
  contractAddress: contractAddress,
);

if (tokenMetadata == null) {
  throw ValidationException('Invalid contract address');
}
```

### Debugging Tips

1. **Enable Debug Logging**: Use Dio interceptors to log requests and responses.

```dart
final dio = Dio();
dio.interceptors.add(LogInterceptor(
  requestBody: true,
  responseBody: true,
  logPrint: (object) => print(object),
));

final sdk = ToronetSDK(network: Network.testnet, dio: dio);
```

2. **Check Response Data**: Inspect API response data for detailed error messages.

```dart
try {
  await sdk.walletService.createWallet(...);
} on APIException catch (e) {
  print('Status Code: ${e.statusCode}');
  print('Error Data: ${e.errorData}');
  print('Message: ${e.message}');
}
```

3. **Network Testing**: Test with testnet first before using mainnet.

```dart
// Always test with testnet first
final testnetSdk = ToronetSDK(network: Network.testnet);
// Test operations...
// Then switch to mainnet
final mainnetSdk = ToronetSDK(network: Network.mainnet);
```

4. **Validate Addresses**: Ensure addresses are in correct format before operations.

```dart
bool isValidAddress(String address) {
  // Toronet addresses start with 0x and are 42 characters
  if (address.startsWith('0x') && address.length == 42) {
    return true;
  }
  return false;
}
```

---

## Additional Resources

- **SDK Documentation**: See `README.md` for API reference
- **Example Code**: Check `example/lib/main.dart` and `example/lib/test.dart` for complete examples
- **Toronet Website**: https://www.toronet.org
- **Toroforge Collective**: https://www.toroforgecollective.com
- **Pub.dev Package**: https://pub.dev/packages/toronet

---

## Support

For issues, questions, or contributions:

1. **GitHub Issues**: Open an issue on the package repository
2. **Documentation**: Refer to this guide and README.md
3. **Community**: Join the Toronet community forums

---

**Last Updated**: After multi-chain bridge integration  
**SDK Version**: Check `pubspec.yaml` for current version

