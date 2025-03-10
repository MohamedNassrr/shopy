class UserRegisterInputModel {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String uId;

  UserRegisterInputModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone,
      required this.uId});
}
