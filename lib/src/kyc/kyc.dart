
class KycParams {
  final String firstName;
  final String middleName;
  final String lastName;
  final String bvn;
  final String currency;
  final String phoneNumber;
  final String dob;
  final String address;
  final String admin;
  final String adminpwd;

  KycParams({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.bvn,
    required this.currency,
    required this.phoneNumber,
    required this.dob,
    required this.address,
    required this.admin,
    required this.adminpwd,
  });
}

abstract class KycService {
  Future<bool> performKYCForCustomer(KycParams params);
  Future<bool> isAddressKYCVerified({required String address});
}
