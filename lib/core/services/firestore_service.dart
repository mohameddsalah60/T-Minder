import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestoreService = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data}) {
    // TODO: implement addData
    throw UnimplementedError();
  }
}
