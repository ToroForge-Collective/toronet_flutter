import 'package:toronet/toronet.dart';

main() async {
  final ToronetSDK sdk = ToronetSDK(baseUrl: 'https://www.toronet.org');
  // Wallet wallet = await sdk.walletService.createWallet(
  //   username: 'testuser664',
  //   password: 'testpassword',
  // );

  // print("Wallet created: ${wallet.address}");

  // print("generated tns : ${wallet.tnsName}");testuser664

  final key = await sdk.walletService.getWalletKey(address: "0x03c8ef05663bd8e4ad8074d650e4ccd33310cd95", password: "testpassword");
  print("wallet key: ${key}");
}
