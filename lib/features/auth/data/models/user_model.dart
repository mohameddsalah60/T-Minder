import 'package:firebase_auth/firebase_auth.dart';
import 'package:tmart_expiry_date/features/auth/domin/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.uId,
    required super.phone,
    required super.zone,
  });
  factory UserModel.fromFirebase(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
      phone: user.phoneNumber ?? '',
      zone: '',
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      uId: user.uId,
      phone: user.phone,
      zone: user.zone,
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'],
      email: data['email'],
      uId: data['uId'],
      phone: data['phone'],
      zone: data['zone'],
    );
  }

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
