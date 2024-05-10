class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String token;
  final String role;

  UserModel(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.token,
      required this.role});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['_id'],
        fullName: json['firstname'] + " " + json['lastname'],
        email: json['email'],
        token: json['token'],
        role: json['role']);
  }
}
