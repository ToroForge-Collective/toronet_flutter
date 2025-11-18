// ignore_for_file: avoid_print

import 'package:toronet/toronet.dart';

main() async {
  print('╔══════════════════════════════════════════════════════════════╗');
  print('║      Toronet Flutter SDK - Comprehensive Usage Examples     ║');
  print('╚══════════════════════════════════════════════════════════════╝\n');

  // ====================================================================
  // Example 1: Network Configuration
  // ====================================================================
  print('═' * 60);
  print('Example 1: Network Configuration');
  print('═' * 60);
  final mainnetSdk = ToronetSDK(network: Network.mainnet);
  final testnetSdk = ToronetSDK(network: Network.testnet);
  final customSdk = ToronetSDK(
    customBaseUrl: 'https://custom.toronet.org',
    customConnectWUrl: 'https://custom-connect.toronet.org',
  );
  print('✓ Mainnet SDK initialized: ${mainnetSdk.walletService}');
  print('✓ Testnet SDK initialized: ${testnetSdk.walletService}');
  print('✓ Custom SDK initialized: ${customSdk.walletService}\n');

  // Use testnet for all examples
  final sdk = testnetSdk;
  final testAddress = '0x03c8ef05663bd8e4ad8074d650e4ccd33310cd95';
  final adminUser = 'admin';
  final adminPwd = 'adminpwd';

  // ====================================================================
  // Example 2: Wallet Management - Complete Operations
  // ====================================================================
  print('═' * 60);
  print('Example 2: Wallet Management');
  print('═' * 60);
  Wallet? createdWallet;
  try {
    // Create wallet
    print('\n2.1 Creating wallet...');
    createdWallet = await sdk.walletService.createWallet(
      username: 'testuser_${DateTime.now().millisecondsSinceEpoch}',
      password: 'testpassword123',
    );
    print('✓ Wallet created: ${createdWallet.address}');
    print('  TNS Name: ${createdWallet.tnsName}');

    // Verify password
    print('\n2.2 Verifying wallet password...');
    final isValid = await sdk.walletService.verifyWalletPassword(
      address: createdWallet.address,
      password: 'testpassword123',
    );
    print('✓ Password valid: $isValid');

    // Get wallet key
    print('\n2.3 Getting wallet key...');
    try {
      final walletKey = await sdk.walletService.getWalletKey(
        address: createdWallet.address,
        password: 'testpassword123',
      );
      print('✓ Wallet key retrieved: ${walletKey.keys.join(", ")}');
    } catch (e) {
      print('⚠ Could not get wallet key: $e');
    }

    // Check TNS availability
    print('\n2.4 Checking TNS availability...');
    final tnsAvailable = await sdk.walletService.isTNSAvailable(
      username: 'newusername',
    );
    print('✓ TNS available: $tnsAvailable');

    // Update password
    print('\n2.5 Updating wallet password...');
    await sdk.walletService.updateWalletPassword(
      address: createdWallet.address,
      oldPassword: 'testpassword123',
      newPassword: 'newpassword456',
    );
    print('✓ Password updated successfully');

    // Verify new password
    final newPasswordValid = await sdk.walletService.verifyWalletPassword(
      address: createdWallet.address,
      password: 'newpassword456',
    );
    print('✓ New password verified: $newPasswordValid');

    // Import wallet (example - would need real private key)
    print('\n2.6 Import wallet example (commented - needs real key)...');
    // final importedWallet = await sdk.walletService.importWalletFromPrivateKey(
    //   privateKey: '0x...',
    //   password: 'importpassword',
    // );
    // print('✓ Wallet imported: ${importedWallet.address}');
  } catch (e) {
    print('✗ Wallet operation error: $e');
  }

  // ====================================================================
  // Example 3: Query Operations - Complete Set
  // ====================================================================
  print('\n═' * 60);
  print('Example 3: Query Operations');
  print('═' * 60);
  try {
    // Exchange rates
    print('\n3.1 Getting exchange rates...');
    final rates = await sdk.queryService.getExchangeRates();
    print('✓ Exchange rates: ${rates.toString().substring(0, 100)}...');

    // Address role
    print('\n3.2 Getting address role...');
    final role = await sdk.queryService.getAddrRole(addr: testAddress);
    print('✓ Address role: $role');

    // Address balance
    print('\n3.3 Getting address balance...');
    final balance = await sdk.queryService.getAddrBalance(addr: testAddress);
    print('✓ Address balance: $balance');

    // Blocks
    print('\n3.4 Getting latest blocks...');
    final blocks = await sdk.queryService.getBlocks(count: 5);
    print('✓ Latest blocks: ${blocks.length}');

    // Get specific block
    if (blocks.isNotEmpty) {
      print('\n3.5 Getting specific block...');
      final blockId = blocks.first['number']?.toString() ?? '0';
      final block = await sdk.queryService.getBlock(blockId: blockId);
      print('✓ Block retrieved: ${block.keys.join(", ")}');
    }

    // Transactions
    print('\n3.6 Getting latest transactions...');
    final transactions = await sdk.queryService.getTransactions(count: 5);
    print('✓ Latest transactions: ${transactions.length}');

    // Get specific transaction
    if (transactions.isNotEmpty) {
      print('\n3.7 Getting specific transaction...');
      final txHash = transactions.first['hash']?.toString() ?? '';
      if (txHash.isNotEmpty) {
        final tx = await sdk.queryService.getTransaction(hash: txHash);
        print('✓ Transaction retrieved: ${tx.keys.join(", ")}');

        // Get receipt
        print('\n3.8 Getting transaction receipt...');
        final receipt = await sdk.queryService.getReceipt(hash: txHash);
        print('✓ Receipt retrieved: ${receipt.keys.join(", ")}');
      }
    }

    // Currency-specific transactions
    print('\n3.9 Getting currency-specific transactions...');
    final toroTxns = await sdk.queryService.getTransactionsToro(count: 3);
    print('✓ Toro transactions: ${toroTxns.length}');

    final nairaTxns = await sdk.queryService.getTransactionsNaira(count: 3);
    print('✓ Naira transactions: ${nairaTxns.length}');

    final euroTxns = await sdk.queryService.getTransactionsEuro(count: 3);
    print('✓ Euro transactions: ${euroTxns.length}');

    final ethTxns = await sdk.queryService.getTransactionsEth(count: 3);
    print('✓ ETH transactions: ${ethTxns.length}');

    // Address-specific transactions
    print('\n3.10 Getting address-specific transactions...');
    final addrToroTxns = await sdk.queryService.getAddrTransactionsToro(
      addr: testAddress,
      count: 3,
    );
    print('✓ Address Toro transactions: ${addrToroTxns.length}');

    final addrNairaTxns = await sdk.queryService.getAddrTransactionsNaira(
      addr: testAddress,
      count: 3,
    );
    print('✓ Address Naira transactions: ${addrNairaTxns.length}');

    // Range queries
    print('\n3.11 Getting transactions by date range...');
    final startDate = DateTime.now().subtract(const Duration(days: 7));
    final endDate = DateTime.now();
    final rangeTxns = await sdk.queryService.getTransactionsRange(
      startDate: startDate.toIso8601String().split('T')[0],
      endDate: endDate.toIso8601String().split('T')[0],
      count: 5,
    );
    print('✓ Range transactions: ${rangeTxns.length}');

    final addrRangeTxns = await sdk.queryService.getAddrTransactionsRange(
      addr: testAddress,
      startDate: startDate.toIso8601String().split('T')[0],
      endDate: endDate.toIso8601String().split('T')[0],
      count: 5,
    );
    print('✓ Address range transactions: ${addrRangeTxns.length}');

    // Events
    print('\n3.12 Getting event...');
    if (transactions.isNotEmpty && transactions.first['hash'] != null) {
      try {
        final event = await sdk.queryService.getEvent(
          hash: transactions.first['hash'].toString(),
        );
        print('✓ Event retrieved: ${event.keys.join(", ")}');
      } catch (e) {
        print('⚠ Event not available: $e');
      }
    }
  } catch (e) {
    print('✗ Query operation error: $e');
  }

  // ====================================================================
  // Example 4: Currency Operations - All Currencies
  // ====================================================================
  print('\n═' * 60);
  print('Example 4: Currency Operations');
  print('═' * 60);
  final currencies = [
    Currency.dollar,
    Currency.naira,
    Currency.euro,
    Currency.pound,
    Currency.ksh,
    Currency.zar,
    Currency.eth,
  ];

  for (final currency in currencies) {
    try {
      print(
        '\n4.${currencies.indexOf(currency) + 1} ${currency.name.toUpperCase()} Operations...',
      );

      // Get balance
      final currencyBalance = await sdk.currencyService.getCurrencyBalance(
        currency: currency,
        address: testAddress,
      );
      print('  ✓ Balance: $currencyBalance');

      // Get name
      final currencyName = await sdk.currencyService.getCurrencyName(
        currency: currency,
      );
      print('  ✓ Name: $currencyName');

      // Get symbol
      final currencySymbol = await sdk.currencyService.getCurrencySymbol(
        currency: currency,
      );
      print('  ✓ Symbol: $currencySymbol');

      // Get transaction fee
      final fee = await sdk.currencyService.getTransactionFee(
        currency: currency,
        amount: '100',
      );
      print('  ✓ Transaction fee: $fee');
    } catch (e) {
      print('  ⚠ ${currency.name} operations failed: $e');
    }
  }

  // ====================================================================
  // Example 5: TNS (Toronet Naming System) Operations
  // ====================================================================
  print('\n═' * 60);
  print('Example 5: TNS Operations');
  print('═' * 60);
  try {
    // Check TNS status
    print('\n5.1 Checking TNS status...');
    final isSetOn = await sdk.tnsService.isSetOn();
    print('✓ TNS set on: $isSetOn');

    final isUpdateOn = await sdk.tnsService.isUpdateOn();
    print('✓ TNS update on: $isUpdateOn');

    final isDeleteOn = await sdk.tnsService.isDeleteOn();
    print('✓ TNS delete on: $isDeleteOn');

    // Get name from address
    print('\n5.2 Getting TNS name from address...');
    try {
      final tnsName = await sdk.tnsService.getName(address: testAddress);
      print('✓ TNS name: $tnsName');
    } catch (e) {
      print('⚠ TNS name not found (expected if not enrolled): $e');
    }

    // Get address from name
    print('\n5.3 Getting address from TNS name...');
    try {
      final tnsAddress = await sdk.tnsService.getAddress(name: 'testname');
      print('✓ TNS address: $tnsAddress');
    } catch (e) {
      print('⚠ TNS address not found: $e');
    }

    // Client operations (would need wallet with password)
    if (createdWallet != null) {
      print('\n5.4 Client TNS operations (commented - needs wallet)...');
      // await sdk.tnsService.setNameClient(
      //   address: createdWallet.address,
      //   password: 'newpassword456',
      //   name: 'mynewname',
      // );
    }

    // Admin operations (commented - needs admin credentials)
    print('\n5.5 Admin TNS operations (commented - needs admin)...');
    // await sdk.tnsService.setNameAdmin(
    //   admin: adminUser,
    //   adminPassword: adminPwd,
    //   address: testAddress,
    //   name: 'adminname',
    // );
  } catch (e) {
    print('✗ TNS operation error: $e');
  }

  // ====================================================================
  // Example 6: Token Operations - Complete Set
  // ====================================================================
  print('\n═' * 60);
  print('Example 6: Token Operations');
  print('═' * 60);
  final tokenTypes = ['toro', 'usdt', 'usdc'];

  for (final tokenType in tokenTypes) {
    try {
      print(
        '\n6.${tokenTypes.indexOf(tokenType) + 1} ${tokenType.toUpperCase()} Token Operations...',
      );

      // Metadata
      final tokenName = await sdk.tokenService.getTokenName(
        tokenType: tokenType,
      );
      print('  ✓ Name: $tokenName');

      final tokenSymbol = await sdk.tokenService.getTokenSymbol(
        tokenType: tokenType,
      );
      print('  ✓ Symbol: $tokenSymbol');

      final decimals = await sdk.tokenService.getTokenDecimal(
        tokenType: tokenType,
      );
      print('  ✓ Decimals: $decimals');

      // Balance
      final tokenBalance = await sdk.tokenService.getTokenBalance(
        tokenType: tokenType,
        address: testAddress,
      );
      print('  ✓ Balance: $tokenBalance');

      // Fees
      final feeFixed = await sdk.tokenService.getTransactionFeeFixed(
        tokenType: tokenType,
      );
      print('  ✓ Fee Fixed: $feeFixed');

      final feePercentage = await sdk.tokenService.getTransactionFeePercentage(
        tokenType: tokenType,
      );
      print('  ✓ Fee Percentage: $feePercentage');

      // Status checks
      final isTransferOn = await sdk.tokenService.isTransferOn(
        tokenType: tokenType,
      );
      print('  ✓ Transfer On: $isTransferOn');

      final isMintOn = await sdk.tokenService.isMintOn(tokenType: tokenType);
      print('  ✓ Mint On: $isMintOn');

      final isBurnOn = await sdk.tokenService.isBurnOn(tokenType: tokenType);
      print('  ✓ Burn On: $isBurnOn');

      // Enrollment
      final isEnrolled = await sdk.tokenService.isTokenEnrolled(
        tokenType: tokenType,
        address: testAddress,
      );
      print('  ✓ Enrolled: $isEnrolled');

      // Allowances
      try {
        final allowance = await sdk.tokenService.getAllowance(
          tokenType: tokenType,
          owner: testAddress,
          spender: testAddress,
        );
        print('  ✓ Allowance: $allowance');
      } catch (e) {
        print('  ⚠ Allowance check failed: $e');
      }
    } catch (e) {
      print('  ⚠ $tokenType operations failed: $e');
    }
  }

  // ====================================================================
  // Example 7: Role Management Operations
  // ====================================================================
  print('\n═' * 60);
  print('Example 7: Role Management');
  print('═' * 60);
  try {
    final roleTypes = [RoleType.admin, RoleType.superadmin, RoleType.debugger];

    for (final roleType in roleTypes) {
      print('\n7.${roleTypes.indexOf(roleType) + 1} ${roleType.name} Role...');

      // Check role
      final hasRole = await sdk.rolesService.isRole(
        roleType: roleType,
        address: testAddress,
      );
      print('  ✓ Has role: $hasRole');

      // Get role index
      try {
        final roleIndex = await sdk.rolesService.getRoleIndex(
          roleType: roleType,
          address: testAddress,
        );
        print('  ✓ Role index: $roleIndex');
      } catch (e) {
        print('  ⚠ Role index not available: $e');
      }

      // Get number of roles
      final roleCount = await sdk.rolesService.getNumberOfRole(
        roleType: roleType,
      );
      print('  ✓ Number of ${roleType.name}s: $roleCount');
    }

    // Admin operations (commented - needs admin credentials)
    print('\n7.6 Admin role operations (commented - needs admin)...');
    // await sdk.rolesService.setRoleAdmin(
    //   admin: adminUser,
    //   adminPassword: adminPwd,
    //   roleType: RoleType.admin,
    //   address: testAddress,
    // );
  } catch (e) {
    print('✗ Role operation error: $e');
  }

  // ====================================================================
  // Example 8: Payment Operations - Complete Set
  // ====================================================================
  print('\n═' * 60);
  print('Example 8: Payment Operations');
  print('═' * 60);
  try {
    // Bank lists
    print('\n8.1 Getting bank lists...');
    try {
      final usdBanks = await sdk.paymentsService.getBankListUSD();
      print('✓ USD banks: ${usdBanks.length}');
      if (usdBanks.isNotEmpty) {
        print('  Sample: ${usdBanks.first}');
      }
    } catch (e) {
      print('⚠ USD banks not available: $e');
    }

    try {
      final ngnBanks = await sdk.paymentsService.getBankListNGN();
      print('✓ NGN banks: ${ngnBanks.length}');
      if (ngnBanks.isNotEmpty) {
        print('  Sample: ${ngnBanks.first}');
      }
    } catch (e) {
      print('⚠ NGN banks not available: $e');
    }

    // Deposit operations (commented - needs admin)
    print('\n8.2 Deposit operations (commented - needs admin)...');
    // final depositResult = await sdk.paymentsService.depositFunds(
    //   userAddress: testAddress,
    //   username: 'testuser',
    //   amount: '1000',
    //   currency: Currency.NGN,
    //   admin: adminUser,
    //   adminpwd: adminPwd,
    // );
    // print('✓ Deposit result: $depositResult');

    // Confirm deposit (commented - needs admin)
    print('\n8.3 Confirm deposit (commented - needs admin)...');
    // await sdk.paymentsService.confirmDeposit(
    //   txid: 'transaction_id',
    //   admin: adminUser,
    //   adminpwd: adminPwd,
    // );

    // Withdrawal operations (commented - needs admin)
    print('\n8.4 Withdrawal operations (commented - needs admin)...');
    // final withdrawalResult = await sdk.paymentsService.recordFiatWithdrawal(
    //   userAddress: testAddress,
    //   username: 'testuser',
    //   amount: '500',
    //   currency: Currency.NGN,
    //   destinationInstitutionCode: '058',
    //   accountNumber: '1234567890',
    //   accountName: 'Test User',
    //   admin: adminUser,
    //   adminpwd: adminPwd,
    // );
    // print('✓ Withdrawal result: $withdrawalResult');

    // Query operations
    print('\n8.5 Querying payment transactions...');
    try {
      final pendingTx = await sdk.paymentsService.getPendingTransaction(
        admin: adminUser,
        adminpwd: adminPwd,
      );
      print('✓ Pending transactions: ${pendingTx.length}');
    } catch (e) {
      print('⚠ Pending transactions not available: $e');
    }

    // Range queries (commented - needs admin)
    print('\n8.6 Range queries (commented - needs admin)...');
    // final startDate = DateTime.now().subtract(const Duration(days: 30));
    // final endDate = DateTime.now();
    // final addressTxns = await sdk.paymentsService.getFiatTransactionsAddressRange(
    //   address: testAddress,
    //   startDate: startDate.toIso8601String().split('T')[0],
    //   endDate: endDate.toIso8601String().split('T')[0],
    //   count: 10,
    //   admin: adminUser,
    //   adminpwd: adminPwd,
    // );
    // print('✓ Address transactions: ${addressTxns.length}');
  } catch (e) {
    print('✗ Payment operation error: $e');
  }

  // ====================================================================
  // Example 9: Product Operations
  // ====================================================================
  print('\n═' * 60);
  print('Example 9: Product Operations');
  print('═' * 60);
  try {
    // Get project info
    print('\n9.1 Getting project info...');
    final projectInfo = await sdk.productsService.getProjectInfo();
    print('✓ Project info: ${projectInfo.keys.join(", ")}');

    // Get product (commented - needs product ID)
    print('\n9.2 Get product (commented - needs product ID)...');
    // final product = await sdk.productsService.getProduct(productId: 'product_id');
    // print('✓ Product: $product');

    // Record product (commented - needs admin)
    print('\n9.3 Record product (commented - needs admin)...');
    // final productData = {
    //   'name': 'Test Product',
    //   'description': 'A test product',
    //   'price': '100',
    // };
    // await sdk.productsService.recordProduct(
    //   productData: productData,
    //   admin: adminUser,
    //   adminpwd: adminPwd,
    // );
  } catch (e) {
    print('✗ Product operation error: $e');
  }

  // ====================================================================
  // Example 10: Virtual Wallet Operations
  // ====================================================================
  print('\n═' * 60);
  print('Example 10: Virtual Wallet Operations');
  print('═' * 60);
  try {
    // Generate virtual wallet (commented - needs admin)
    print('\n10.1 Generate virtual wallet (commented - needs admin)...');
    // final virtualWallet = await sdk.virtualService.generateVirtualWallet(
    //   admin: adminUser,
    //   adminpwd: adminPwd,
    // );
    // print('✓ Virtual wallet: $virtualWallet');

    // Get virtual wallet (commented - needs wallet ID)
    print('\n10.2 Get virtual wallet (commented - needs wallet ID)...');
    // final vWallet = await sdk.virtualService.getVirtualWallet(walletId: 'wallet_id');
    // print('✓ Virtual wallet: $vWallet');

    // Get by address (commented - needs address)
    print(
      '\n10.3 Get virtual wallet by address (commented - needs address)...',
    );
    // final vWalletByAddr = await sdk.virtualService.getVirtualWalletByAddress(
    //   address: testAddress,
    // );
    // print('✓ Virtual wallet: $vWalletByAddr');
  } catch (e) {
    print('✗ Virtual wallet operation error: $e');
  }

  // ====================================================================
  // Example 11: Blockchain Operations
  // ====================================================================
  print('\n═' * 60);
  print('Example 11: Blockchain Operations');
  print('═' * 60);
  try {
    // Blockchain status
    print('\n11.1 Getting blockchain status...');
    final status = await sdk.blockchainService.getBlockchainStatus();
    print('✓ Blockchain status: ${status.keys.join(", ")}');

    // Latest block
    print('\n11.2 Getting latest block...');
    final latestBlock = await sdk.blockchainService.getLatestBlockData();
    print('✓ Latest block: ${latestBlock.keys.join(", ")}');

    // Get transaction by ID
    print('\n11.3 Getting transaction by ID (commented - needs hash)...');
    // final tx = await sdk.blockchainService.getTransaction(hash: '0x...');
    // print('✓ Transaction: $tx');

    // Get receipt
    print('\n11.4 Getting receipt (commented - needs hash)...');
    // final receipt = await sdk.blockchainService.getReceipt(hash: '0x...');
    // print('✓ Receipt: $receipt');
  } catch (e) {
    print('✗ Blockchain operation error: $e');
  }

  // ====================================================================
  // Example 12: Exchange Operations
  // ====================================================================
  print('\n═' * 60);
  print('Example 12: Exchange Operations');
  print('═' * 60);
  try {
    // Get exchange rates
    print('\n12.1 Getting exchange rates...');
    final exchangeRates =
        await sdk.exchangeService.getSupportedAssetsExchangeRates();
    print('✓ Exchange rates: ${exchangeRates.keys.join(", ")}');
  } catch (e) {
    print('✗ Exchange operation error: $e');
  }

  // ====================================================================
  // Example 13: Balance Operations
  // ====================================================================
  print('\n═' * 60);
  print('Example 13: Balance Operations');
  print('═' * 60);
  try {
    // Get balance
    print('\n13.1 Getting balance...');
    final balance = await sdk.balanceService.getBalance(address: testAddress);
    print('✓ Balance: $balance');
  } catch (e) {
    print('✗ Balance operation error: $e');
  }

  // ====================================================================
  // Example 14: KYC Operations
  // ====================================================================
  print('\n═' * 60);
  print('Example 14: KYC Operations');
  print('═' * 60);
  try {
    // Perform KYC (commented - needs admin)
    print('\n14.1 Perform KYC (commented - needs admin)...');
    // final kycParams = KycParams(
    //   firstName: 'John',
    //   middleName: 'A',
    //   lastName: 'Doe',
    //   bvn: '12345678901',
    //   currency: 'NGN',
    //   phoneNumber: '08012345678',
    //   dob: '1990-01-01',
    //   address: 'Lagos',
    //   admin: adminUser,
    //   adminpwd: adminPwd,
    // );
    // final kycResult = await sdk.kycService.performKYCForCustomer(kycParams);
    // print('✓ KYC result: $kycResult');
  } catch (e) {
    print('✗ KYC operation error: $e');
  }

  // ====================================================================
  // Example 15: Error Handling - Comprehensive
  // ====================================================================
  print('\n═' * 60);
  print('Example 15: Error Handling');
  print('═' * 60);

  // Validation error
  print('\n15.1 Testing validation error...');
  try {
    await sdk.walletService.createWallet(username: '', password: '');
  } on ValidationException catch (e) {
    print('✓ ValidationException caught: ${e.message}');
  } catch (e) {
    print('⚠ Unexpected error: $e');
  }

  // API error
  print('\n15.2 Testing API error...');
  try {
    await sdk.queryService.getTransaction(hash: 'invalid_hash');
  } on APIException catch (e) {
    print('✓ APIException caught: ${e.message}');
    print('  Status code: ${e.statusCode}');
  } catch (e) {
    print('⚠ Unexpected error: $e');
  }

  // Network error
  print('\n15.3 Testing network error...');
  try {
    final badSdk = ToronetSDK(customBaseUrl: 'https://invalid-url-12345.com');
    await badSdk.queryService.getExchangeRates();
  } on NetworkException catch (e) {
    print('✓ NetworkException caught: ${e.message}');
  } catch (e) {
    print('⚠ Error (may be NetworkException): $e');
  }

  // Authentication error
  print('\n15.4 Testing authentication error...');
  try {
    await sdk.paymentsService.getPendingTransaction(
      admin: 'invalid',
      adminpwd: 'invalid',
    );
  } on AuthenticationException catch (e) {
    print('✓ AuthenticationException caught: ${e.message}');
  } on APIException catch (e) {
    print('⚠ APIException (may indicate auth failure): ${e.message}');
  } catch (e) {
    print('⚠ Unexpected error: $e');
  }

  // Generic SDK error
  print('\n15.5 Testing generic SDK error...');
  try {
    await sdk.walletService.verifyWalletPassword(
      address: 'invalid_address',
      password: 'password',
    );
  } on ToroSDKException catch (e) {
    print('✓ ToroSDKException caught: ${e.message}');
  } catch (e) {
    print('⚠ Unexpected error: $e');
  }

  // ====================================================================
  // Summary
  // ====================================================================
  print('\n${'═' * 60}');
  print('Examples Complete!');
  print('═' * 60);
  print('\nThis comprehensive example demonstrates:');
  print('  ✓ Network configuration (mainnet/testnet/custom)');
  print('  ✓ Complete wallet management');
  print('  ✓ All query operations');
  print('  ✓ All currency operations');
  print('  ✓ TNS operations');
  print('  ✓ Token operations');
  print('  ✓ Role management');
  print('  ✓ Payment operations');
  print('  ✓ Product operations');
  print('  ✓ Virtual wallet operations');
  print('  ✓ Blockchain operations');
  print('  ✓ Exchange operations');
  print('  ✓ Balance operations');
  print('  ✓ KYC operations');
  print('  ✓ Comprehensive error handling');
  print('\nNote: Some operations are commented out as they require');
  print('      admin credentials, valid wallet keys, or specific data.');
  print('      Uncomment and provide appropriate values to test them.\n');
}
