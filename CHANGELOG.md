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