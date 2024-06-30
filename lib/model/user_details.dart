class UserDetails {
  final String name;
  final String email;
  final String address;

  UserDetails({required this.name, required this.email, required this.address});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      name: json['name'],
      email: json['email'],
      address: json['address'],
    );
  }
}
