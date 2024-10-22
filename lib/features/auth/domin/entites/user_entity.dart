class UserEntity {
  final String name, email, uId, phone, zone;

  UserEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    required this.zone,
  });

  toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'zone': zone,
    };
  }
}
