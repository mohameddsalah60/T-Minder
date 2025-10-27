import 'dart:convert';

import 'package:tmart_expiry_date/core/services/shared_preferences_singletone.dart';
import 'package:tmart_expiry_date/features/auth/data/models/user_model.dart';
import 'package:tmart_expiry_date/features/auth/domin/entites/user_entity.dart';

UserEntity getUser() {
  var jsonData = Prefs.getString('userData');
  var userEntity = UserModel.fromJson(jsonDecode(jsonData));
  return userEntity;
}
