## 0.0.5

* Added ContractService: sign messages, recover message signers, call contract functions with automatic argument/ABI encoding
* Added DeployerService: deploy compiled smart contracts to Toronet mainnet or testnet via Toroforge
* Added ETHService: Ethereum blockchain bridge, balance queries, transaction queries, token transfers, payment operations, and reserve management
* Added TronService: Tron (TRX) blockchain integration including address validation, balance queries, transaction queries, TRX and TRC-20 token transfers
* Added AVAXService: Avalanche reserve management (project and merchant reserves)
* Added StorageService: on-chain storage state management (register/unregister contracts, version control, ownership transfer)
* Added UtilService: address validation and transaction count queries
* Added RawService: send raw transaction data to the Toronet blockchain
* Added AuthService: client authentication, token verification, refresh, and status queries
* Extended BSCService, PolygonService, BaseService, ArbitrumService with gas token transfers and reserve management
* Extended ETHService with payment initialization, cancellation, and merchant reserve operations
* Added Network-aware deployer URL resolution (mainnet/testnet) with custom URL override support
* Improved README with Table of Contents, corrected dependency versions, and comprehensive usage examples for all services
* Fixed curly_braces_in_flow_control_structures lint issues

## 0.0.4

* Added multi-chain bridge support for Solana, Polygon, BSC, Base, and Arbitrum
* Added SolanaService with comprehensive Solana operations (address creation, validation, transfers, bridge, balance, transactions, payments)
* Added PolygonService with bridge, balance, transactions, and payment operations
* Added BSCService with bridge, balance, transactions, and payment operations
* Added BaseService with bridge, balance, transactions, and payment operations
* Added ArbitrumService with bridge, balance, transactions, and payment operations
* All chain services use the same base URL as Toronet mainnet/testnet with `/cryptoutils` suffix for bridge operations
* Payment operations for all chains use `/payment` endpoint

## 0.0.3

* Comprehensive SDK examples and documentation updates
* Added network configuration support (mainnet/testnet)
* Added all missing implementations and services
* Improved error handling with custom exceptions

## 0.0.2

* Stable Version