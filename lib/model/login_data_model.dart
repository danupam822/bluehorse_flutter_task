class LoginUserModel {
  final int id; // Add id field
  final String email;
  final String password;

  LoginUserModel({required this.id, required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
    };
  }

  factory LoginUserModel.fromMap(Map<String, dynamic> map) {
    return LoginUserModel(
      id: map['id'],
      email: map['email'],
      password: map['password'],
    );
  }
}
