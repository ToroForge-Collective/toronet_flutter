// ignore_for_file: avoid_print

import 'package:toronet/toronet.dart';

main() async {
  final ToronetSDK sdk = ToronetSDK();
  Wallet wallet = await sdk.walletService.createWallet(
    username: 'naruto_uzumaki',
    password: 'kurama',
  );

  print("Wallet created: ${wallet.address}");

  final key = await sdk.walletService.getWalletKey(
    address: "0x03c8ef05663bd8e4ad8074d650e4ccd33310cd95",
    password: "testpassword",
  );
  print("wallet key: $key");

  var blockchainStatus = await sdk.blockchainService.getBlockchainStatus();
  print("blockchain status: $blockchainStatus");

  var blocksData = await sdk.blockchainService.getBlocksData(10);
  print("blocks data: $blocksData");

  var latestBlockData = await sdk.blockchainService.getLatestBlockData();
  print("latest block data: $latestBlockData");

  // var walletDetails = await sdk.walletService.importWalletFromPrivateKey(
  //   privateKey: "0x03c8ef05663bd8e4ad8074d650e4ccd33310cd95",
  //   password: "testpassword",
  // );
  // print("wallet details: $walletDetails");

  var walletBalance = await sdk.balanceService.getBalance(
    address: "0x03c8ef05663bd8e4ad8074d650e4ccd33310cd95",
  );
  print("wallet balance: $walletBalance");

  var kycStatus = await sdk.kycService.isAddressKYCVerified(
    address: "0x03c8ef05663bd8e4ad8074d650e4ccd33310cd95",
  );
  print("kyc status: $kycStatus");

  var exchangeRates =
      await sdk.exchangeService.getSupportedAssetsExchangeRates();
  print("exchange rates: $exchangeRates");
}
