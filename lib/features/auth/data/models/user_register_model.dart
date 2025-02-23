class UserRegisterModel {
  String? email;
  String? name;
  String? uId;
  String? phone;

  UserRegisterModel({
    required this.email,
    required this.name,
    required this.uId,
    required this.phone,
  });

  UserRegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    uId = json['uId'];
    phone = json['phone'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'uId': uId,
      'phone': phone,
    };
  }
}
