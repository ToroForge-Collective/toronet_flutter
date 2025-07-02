import 'package:flutter/material.dart';
import 'package:toronet/toronet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toronet SDK Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Toronet SDK Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ToronetSDK sdk = ToronetSDK(baseUrl: 'https://www.toronet.org');

  String _result = '';
  Wallet? _wallet;

  // Example: Create Wallet
  Future<void> _createWallet() async {
    try {
      final wallet = await sdk.walletService.createWallet(
        username: 'testuser${DateTime.now().millisecondsSinceEpoch}',
        password: 'testpassword',
      );
      setState(() {
        _wallet = wallet;
        _result = 'Wallet created: ${wallet.address} (TNS: ${wallet.tnsName})';
      });
    } catch (e) {
      setState(() => _result = 'Error: $e');
    }
  }

  // Example: Import Wallet
  Future<void> _importWallet() async {
    try {
      // Replace with a real private key for actual use
      final wallet = await sdk.walletService.importWalletFromPrivateKey(
        privateKey: 'your_private_key_here',
        password: 'testpassword',
      );
      setState(() {
        _wallet = wallet;
        _result = 'Wallet imported: ${wallet.address} (TNS: ${wallet.tnsName})';
      });
    } catch (e) {
      setState(() => _result = 'Error: $e');
    }
  }

  // Example: Get Balance
  Future<void> _fetchBalance() async {
    try {
      final address = _wallet?.address ?? '0x1234567890abcdef';
      final result = await sdk.balanceService.getBalance(address: address);
      setState(() => _result = 'Balance: $result');
    } catch (e) {
      setState(() => _result = 'Error: $e');
    }
  }

  // Example: Blockchain Status
  Future<void> _fetchBlockchainStatus() async {
    try {
      final result = await sdk.blockchainService.getBlockchainStatus();
      setState(() => _result = 'Blockchain Status: $result');
    } catch (e) {
      setState(() => _result = 'Error: $e');
    }
  }

  // Example: Latest Block
  Future<void> _fetchLatestBlock() async {
    try {
      final result = await sdk.blockchainService.getLatestBlockData();
      setState(() => _result = 'Latest Block: $result');
    } catch (e) {
      setState(() => _result = 'Error: $e');
    }
  }

  // Example: KYC Verification
  Future<void> _performKYC() async {
    try {
      final params = KycParams(
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
      );
      final result = await sdk.kycService.performKYCForCustomer(params);
      setState(() => _result = 'KYC performed: $result');
    } catch (e) {
      setState(() => _result = 'Error: $e');
    }
  }

  // Example: Payments Deposit
  Future<void> _depositFunds() async {
    try {
      final result = await sdk.paymentsService.depositFunds(
        userAddress: _wallet?.address ?? '0x1234567890abcdef',
        username: 'testuser',
        amount: '1000',
        currency: Currency.NGN,
        admin: 'admin',
        adminpwd: 'adminpwd',
      );
      setState(() => _result = 'Deposit Result: $result');
    } catch (e) {
      setState(() => _result = 'Error: $e');
    }
  }

  // Example: Exchange Rates
  Future<void> _fetchExchangeRates() async {
    try {
      final result =
          await sdk.exchangeService.getSupportedAssetsExchangeRates();
      setState(() => _result = 'Exchange Rates: $result');
    } catch (e) {
      setState(() => _result = 'Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _createWallet,
                child: const Text('Create Wallet'),
              ),
              ElevatedButton(
                onPressed: _importWallet,
                child: const Text('Import Wallet'),
              ),
              ElevatedButton(
                onPressed: _fetchBalance,
                child: const Text('Fetch Balance'),
              ),
              ElevatedButton(
                onPressed: _fetchBlockchainStatus,
                child: const Text('Blockchain Status'),
              ),
              ElevatedButton(
                onPressed: _fetchLatestBlock,
                child: const Text('Latest Block'),
              ),
              ElevatedButton(
                onPressed: _performKYC,
                child: const Text('Perform KYC'),
              ),
              ElevatedButton(
                onPressed: _depositFunds,
                child: const Text('Deposit Funds'),
              ),
              ElevatedButton(
                onPressed: _fetchExchangeRates,
                child: const Text('Fetch Exchange Rates'),
              ),
              const SizedBox(height: 24),
              Text(
                _result,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
