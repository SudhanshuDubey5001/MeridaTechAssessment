class UserSBI {
  String uid;
  String name;
  String address;
  double saving_account_balance;

  UserSBI(
      {required this.uid,
      this.name = "",
      this.address = "",
      this.saving_account_balance = 0.0});
}
