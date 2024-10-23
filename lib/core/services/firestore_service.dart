import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestoreService = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    String? docId,
    required Map<String, dynamic> data,
  }) async {
    if (docId != null) {
      await firestoreService.collection(path).doc(docId).set(data);
    } else {
      await firestoreService.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String uId}) async {
    var data = await firestoreService.collection(path).doc(uId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String docId}) async {
    var data = await firestoreService.collection(path).doc(docId).get();
    return data.exists;
  }

  @override
  Future<void> updateData(
      {required String path,
      required String uId,
      required Map<String, dynamic> value}) async {
    await firestoreService.collection(path).doc(uId).update(value);
  }
}
