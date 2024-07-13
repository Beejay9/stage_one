class AppUser {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  AppUser({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });
  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone']);

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
      };
}
