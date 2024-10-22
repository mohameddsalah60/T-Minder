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
  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'],
      email: data['email'],
      uId: data['uId'],
      phone: data['phone'],
      zone: "",
    );
  }
}
