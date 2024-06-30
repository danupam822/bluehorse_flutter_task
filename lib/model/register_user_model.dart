class UserregisterModel {
  final String name;
  final String email;
  final String password;
  final String address;
  final double lat;
  final double long;

  UserregisterModel({
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.lat,
    required this.long,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'lat': lat,
      'long': long,
    };
  }
}
