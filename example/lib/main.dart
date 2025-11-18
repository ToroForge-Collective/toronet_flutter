import 'package:flutter/material.dart';
import 'package:toronet/toronet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toronet SDK Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Toronet SDK Comprehensive Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ToronetSDK sdk;
  String _result = '';
  Wallet? _wallet;
  Network _currentNetwork = Network.testnet;
  bool _isLoading = false;

  // Test addresses and credentials
  final String testAddress = '0x03c8ef05663bd8e4ad8074d650e4ccd33310cd95';
  final String adminUser = 'admin';
  final String adminPwd = 'adminpwd';

  @override
  void initState() {
    super.initState();
    sdk = ToronetSDK(network: _currentNetwork);
  }

  void _updateResult(String message) {
    setState(() {
      _result = message;
      _isLoading = false;
    });
  }

  void _setLoading(bool loading) {
    setState(() {
      _isLoading = loading;
    });
  }

  // ====================================================================
  // Network Configuration
  // ====================================================================
  Future<void> _switchNetwork(Network network) async {
    _setLoading(true);
    try {
      setState(() {
        _currentNetwork = network;
        sdk = ToronetSDK(network: network);
      });
      _updateResult('Switched to ${network.name} network');
    } catch (e) {
      _updateResult('Error switching network: $e');
    }
  }

  // ====================================================================
  // Wallet Operations
  // ====================================================================
  Future<void> _createWallet() async {
    _setLoading(true);
    try {
      final wallet = await sdk.walletService.createWallet(
        username: 'testuser_${DateTime.now().millisecondsSinceEpoch}',
        password: 'testpassword123',
      );
      setState(() => _wallet = wallet);
      _updateResult(
        'Wallet created!\nAddress: ${wallet.address}\nTNS: ${wallet.tnsName}',
      );
    } catch (e) {
      _updateResult('Error creating wallet: $e');
    }
  }

  Future<void> _importWallet() async {
    _setLoading(true);
    _updateResult(
      'Import wallet requires a private key.\nUse: sdk.walletService.importWalletFromPrivateKey(...)',
    );
  }

  Future<void> _verifyPassword() async {
    if (_wallet == null) {
      _updateResult('Please create a wallet first');
      return;
    }
    _setLoading(true);
    try {
      final isValid = await sdk.walletService.verifyWalletPassword(
        address: _wallet!.address,
        password: 'testpassword123',
      );
      _updateResult('Password verification: ${isValid ? "Valid" : "Invalid"}');
    } catch (e) {
      _updateResult('Error verifying password: $e');
    }
  }

  Future<void> _updatePassword() async {
    if (_wallet == null) {
      _updateResult('Please create a wallet first');
      return;
    }
    _setLoading(true);
    try {
      await sdk.walletService.updateWalletPassword(
        address: _wallet!.address,
        oldPassword: 'testpassword123',
        newPassword: 'newpassword456',
      );
      _updateResult('Password updated successfully');
    } catch (e) {
      _updateResult('Error updating password: $e');
    }
  }

  Future<void> _checkTNSAvailability() async {
    _setLoading(true);
    try {
      final available = await sdk.walletService.isTNSAvailable(
        username: 'testusername',
      );
      _updateResult(
        'TNS "testusername" is ${available ? "available" : "not available"}',
      );
    } catch (e) {
      _updateResult('Error checking TNS: $e');
    }
  }

  // ====================================================================
  // Query Operations
  // ====================================================================
  Future<void> _getExchangeRates() async {
    _setLoading(true);
    try {
      final rates = await sdk.queryService.getExchangeRates();
      _updateResult(
        'Exchange Rates:\n${rates.toString().substring(0, 200)}...',
      );
    } catch (e) {
      _updateResult('Error getting exchange rates: $e');
    }
  }

  Future<void> _getAddressRole() async {
    _setLoading(true);
    try {
      final role = await sdk.queryService.getAddrRole(addr: testAddress);
      _updateResult('Address Role:\n$role');
    } catch (e) {
      _updateResult('Error getting address role: $e');
    }
  }

  Future<void> _getAddressBalance() async {
    _setLoading(true);
    try {
      final balance = await sdk.queryService.getAddrBalance(addr: testAddress);
      _updateResult('Address Balance:\n$balance');
    } catch (e) {
      _updateResult('Error getting address balance: $e');
    }
  }

  Future<void> _getLatestBlocks() async {
    _setLoading(true);
    try {
      final blocks = await sdk.queryService.getBlocks(count: 5);
      _updateResult('Latest Blocks: ${blocks.length} blocks retrieved');
    } catch (e) {
      _updateResult('Error getting blocks: $e');
    }
  }

  Future<void> _getLatestTransactions() async {
    _setLoading(true);
    try {
      final transactions = await sdk.queryService.getTransactions(count: 5);
      _updateResult(
        'Latest Transactions: ${transactions.length} transactions retrieved',
      );
    } catch (e) {
      _updateResult('Error getting transactions: $e');
    }
  }

  Future<void> _getCurrencyTransactions() async {
    _setLoading(true);
    try {
      final nairaTxns = await sdk.queryService.getTransactionsNaira(count: 3);
      final euroTxns = await sdk.queryService.getTransactionsEuro(count: 3);
      final ethTxns = await sdk.queryService.getTransactionsEth(count: 3);
      _updateResult(
        'Currency Transactions:\nNGN: ${nairaTxns.length}\nEUR: ${euroTxns.length}\nETH: ${ethTxns.length}',
      );
    } catch (e) {
      _updateResult('Error getting currency transactions: $e');
    }
  }

  // ====================================================================
  // Currency Operations
  // ====================================================================
  Future<void> _getCurrencyBalance() async {
    _setLoading(true);
    try {
      final dollarBalance = await sdk.currencyService.getCurrencyBalance(
        currency: Currency.dollar,
        address: testAddress,
      );
      final ngnBalance = await sdk.currencyService.getCurrencyBalance(
        currency: Currency.naira,
        address: testAddress,
      );
      _updateResult(
        'Currency Balances:\nUSD: $dollarBalance\nNGN: $ngnBalance',
      );
    } catch (e) {
      _updateResult('Error getting currency balance: $e');
    }
  }

  Future<void> _getCurrencyInfo() async {
    _setLoading(true);
    try {
      final dollarName = await sdk.currencyService.getCurrencyName(
        currency: Currency.dollar,
      );
      final dollarSymbol = await sdk.currencyService.getCurrencySymbol(
        currency: Currency.dollar,
      );
      final fee = await sdk.currencyService.getTransactionFee(
        currency: Currency.dollar,
        amount: '100',
      );
      _updateResult(
        'USD Currency Info:\nName: $dollarName\nSymbol: $dollarSymbol\nFee: $fee',
      );
    } catch (e) {
      _updateResult('Error getting currency info: $e');
    }
  }

  // ====================================================================
  // TNS Operations
  // ====================================================================
  Future<void> _checkTNSStatus() async {
    _setLoading(true);
    try {
      final isSetOn = await sdk.tnsService.isSetOn();
      final isUpdateOn = await sdk.tnsService.isUpdateOn();
      final isDeleteOn = await sdk.tnsService.isDeleteOn();
      _updateResult(
        'TNS Status:\nSet On: $isSetOn\nUpdate On: $isUpdateOn\nDelete On: $isDeleteOn',
      );
    } catch (e) {
      _updateResult('Error checking TNS status: $e');
    }
  }

  Future<void> _getTNSName() async {
    _setLoading(true);
    try {
      final name = await sdk.tnsService.getName(address: testAddress);
      _updateResult('TNS Name for $testAddress:\n$name');
    } catch (e) {
      _updateResult('TNS name not found (expected if not enrolled)');
    }
  }

  // ====================================================================
  // Token Operations
  // ====================================================================
  Future<void> _getTokenInfo() async {
    _setLoading(true);
    try {
      final tokenName = await sdk.tokenService.getTokenName(tokenType: 'toro');
      final tokenSymbol = await sdk.tokenService.getTokenSymbol(
        tokenType: 'toro',
      );
      final decimals = await sdk.tokenService.getTokenDecimal(
        tokenType: 'toro',
      );
      final totalCap = await sdk.tokenService.getTotalCap(tokenType: 'toro');
      _updateResult(
        'TORO Token Info:\nName: $tokenName\nSymbol: $tokenSymbol\nDecimals: $decimals\nTotal Cap: $totalCap',
      );
    } catch (e) {
      _updateResult('Error getting token info: $e');
    }
  }

  Future<void> _getTokenBalance() async {
    _setLoading(true);
    try {
      final balance = await sdk.tokenService.getTokenBalance(
        tokenType: 'toro',
        address: testAddress,
      );
      _updateResult('TORO Token Balance:\n$balance');
    } catch (e) {
      _updateResult('Error getting token balance: $e');
    }
  }

  Future<void> _getTokenFees() async {
    _setLoading(true);
    try {
      final feeFixed = await sdk.tokenService.getTransactionFeeFixed(
        tokenType: 'toro',
      );
      final feePercentage = await sdk.tokenService.getTransactionFeePercentage(
        tokenType: 'toro',
      );
      _updateResult(
        'TORO Token Fees:\nFixed: $feeFixed\nPercentage: $feePercentage',
      );
    } catch (e) {
      _updateResult('Error getting token fees: $e');
    }
  }

  // ====================================================================
  // Role Management
  // ====================================================================
  Future<void> _checkRoles() async {
    _setLoading(true);
    try {
      final isAdmin = await sdk.rolesService.isRole(
        roleType: RoleType.admin,
        address: testAddress,
      );
      final isSuperAdmin = await sdk.rolesService.isRole(
        roleType: RoleType.superadmin,
        address: testAddress,
      );
      final adminCount = await sdk.rolesService.getNumberOfRole(
        roleType: RoleType.admin,
      );
      _updateResult(
        'Role Status:\nIs Admin: $isAdmin\nIs SuperAdmin: $isSuperAdmin\nAdmin Count: $adminCount',
      );
    } catch (e) {
      _updateResult('Error checking roles: $e');
    }
  }

  // ====================================================================
  // Payment Operations
  // ====================================================================
  Future<void> _getBankLists() async {
    _setLoading(true);
    try {
      final usdBanks = await sdk.paymentsService.getBankListUSD();
      final ngnBanks = await sdk.paymentsService.getBankListNGN();
      _updateResult(
        'Bank Lists:\nUSD Banks: ${usdBanks.length}\nNGN Banks: ${ngnBanks.length}',
      );
    } catch (e) {
      _updateResult('Error getting bank lists: $e');
    }
  }

  Future<void> _getPendingTransactions() async {
    _setLoading(true);
    try {
      final pending = await sdk.paymentsService.getPendingTransaction(
        admin: adminUser,
        adminpwd: adminPwd,
      );
      _updateResult('Pending Transactions: ${pending.length}');
    } catch (e) {
      _updateResult('Error getting pending transactions: $e');
    }
  }

  // ====================================================================
  // Product Operations
  // ====================================================================
  Future<void> _getProjectInfo() async {
    _setLoading(true);
    try {
      final projectInfo = await sdk.productsService.getProjectInfo();
      _updateResult('Project Info:\n${projectInfo.keys.join(", ")}');
    } catch (e) {
      _updateResult('Error getting project info: $e');
    }
  }

  // ====================================================================
  // Blockchain Operations
  // ====================================================================
  Future<void> _getBlockchainStatus() async {
    _setLoading(true);
    try {
      final status = await sdk.blockchainService.getBlockchainStatus();
      _updateResult(
        'Blockchain Status:\n${status.toString().substring(0, 200)}...',
      );
    } catch (e) {
      _updateResult('Error getting blockchain status: $e');
    }
  }

  Future<void> _getLatestBlock() async {
    _setLoading(true);
    try {
      final block = await sdk.blockchainService.getLatestBlockData();
      _updateResult('Latest Block:\n${block.toString().substring(0, 200)}...');
    } catch (e) {
      _updateResult('Error getting latest block: $e');
    }
  }

  // ====================================================================
  // Exchange Operations
  // ====================================================================
  Future<void> _getExchangeRatesFromService() async {
    _setLoading(true);
    try {
      final rates = await sdk.exchangeService.getSupportedAssetsExchangeRates();
      _updateResult(
        'Exchange Rates:\n${rates.toString().substring(0, 200)}...',
      );
    } catch (e) {
      _updateResult('Error getting exchange rates: $e');
    }
  }

  // ====================================================================
  // Balance Operations
  // ====================================================================
  Future<void> _getBalance() async {
    _setLoading(true);
    try {
      final balance = await sdk.balanceService.getBalance(address: testAddress);
      _updateResult('Balance for $testAddress:\n$balance');
    } catch (e) {
      _updateResult('Error getting balance: $e');
    }
  }

  // ====================================================================
  // Error Handling Demo
  // ====================================================================
  Future<void> _demoErrorHandling() async {
    _setLoading(true);
    try {
      // This should trigger a validation error
      await sdk.walletService.createWallet(username: '', password: '');
    } on ValidationException catch (e) {
      _updateResult('✓ ValidationException caught:\n${e.message}');
    } on APIException catch (e) {
      _updateResult('✓ APIException caught:\n${e.message}');
    } on ToroSDKException catch (e) {
      _updateResult('✓ ToroSDKException caught:\n${e.message}');
    } catch (e) {
      _updateResult('Unexpected error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          PopupMenuButton<Network>(
            icon: const Icon(Icons.settings),
            onSelected: _switchNetwork,
            itemBuilder:
                (context) => [
                  const PopupMenuItem(
                    value: Network.mainnet,
                    child: Text('Mainnet'),
                  ),
                  const PopupMenuItem(
                    value: Network.testnet,
                    child: Text('Testnet'),
                  ),
                ],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Network: ${_currentNetwork.name}'),
            ),
          ),
        ],
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Network Status
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Current Network: ${_currentNetwork.name.toUpperCase()}',
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Wallet Operations Section
                      _buildSection(context, 'Wallet Operations', [
                        _buildButton('Create Wallet', _createWallet),
                        _buildButton('Import Wallet', _importWallet),
                        _buildButton('Verify Password', _verifyPassword),
                        _buildButton('Update Password', _updatePassword),
                        _buildButton(
                          'Check TNS Availability',
                          _checkTNSAvailability,
                        ),
                      ]),

                      // Query Operations Section
                      _buildSection(context, 'Query Operations', [
                        _buildButton('Get Exchange Rates', _getExchangeRates),
                        _buildButton('Get Address Role', _getAddressRole),
                        _buildButton('Get Address Balance', _getAddressBalance),
                        _buildButton('Get Latest Blocks', _getLatestBlocks),
                        _buildButton(
                          'Get Latest Transactions',
                          _getLatestTransactions,
                        ),
                        _buildButton(
                          'Get Currency Transactions',
                          _getCurrencyTransactions,
                        ),
                      ]),

                      // Currency Operations Section
                      _buildSection(context, 'Currency Operations', [
                        _buildButton(
                          'Get Currency Balance',
                          _getCurrencyBalance,
                        ),
                        _buildButton('Get Currency Info', _getCurrencyInfo),
                      ]),

                      // TNS Operations Section
                      _buildSection(context, 'TNS Operations', [
                        _buildButton('Check TNS Status', _checkTNSStatus),
                        _buildButton('Get TNS Name', _getTNSName),
                      ]),

                      // Token Operations Section
                      _buildSection(context, 'Token Operations', [
                        _buildButton('Get Token Info', _getTokenInfo),
                        _buildButton('Get Token Balance', _getTokenBalance),
                        _buildButton('Get Token Fees', _getTokenFees),
                      ]),

                      // Role Management Section
                      _buildSection(context, 'Role Management', [
                        _buildButton('Check Roles', _checkRoles),
                      ]),

                      // Payment Operations Section
                      _buildSection(context, 'Payment Operations', [
                        _buildButton('Get Bank Lists', _getBankLists),
                        _buildButton(
                          'Get Pending Transactions',
                          _getPendingTransactions,
                        ),
                      ]),

                      // Product Operations Section
                      _buildSection(context, 'Product Operations', [
                        _buildButton('Get Project Info', _getProjectInfo),
                      ]),

                      // Blockchain Operations Section
                      _buildSection(context, 'Blockchain Operations', [
                        _buildButton(
                          'Get Blockchain Status',
                          _getBlockchainStatus,
                        ),
                        _buildButton('Get Latest Block', _getLatestBlock),
                      ]),

                      // Exchange Operations Section
                      _buildSection(context, 'Exchange Operations', [
                        _buildButton(
                          'Get Exchange Rates',
                          _getExchangeRatesFromService,
                        ),
                      ]),

                      // Balance Operations Section
                      _buildSection(context, 'Balance Operations', [
                        _buildButton('Get Balance', _getBalance),
                      ]),

                      // Error Handling Section
                      _buildSection(context, 'Error Handling Demo', [
                        _buildButton('Demo Error Handling', _demoErrorHandling),
                      ]),

                      // Result Display
                      const SizedBox(height: 24),
                      Card(
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Result:',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                _result.isEmpty
                                    ? 'No operation performed yet'
                                    : _result,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> buttons,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: Theme.of(context).textTheme.titleLarge),
            ),
            ...buttons,
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ElevatedButton(onPressed: onPressed, child: Text(label)),
    );
  }
}
