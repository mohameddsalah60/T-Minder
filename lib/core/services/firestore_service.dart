import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestoreService = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    String? docId,
    String? subPath,
    required Map<String, dynamic> data,
  }) async {
    if (docId != null) {
      await firestoreService.collection(path).doc(docId).set(data);
    } else if (subPath != null) {
      await firestoreService
          .collection(path)
          .doc(docId)
          .collection(subPath)
          .add(data);
    } else {
      await firestoreService.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? uId,
    String? subPath,
    Map<String, dynamic>? query,
  }) async {
    if (uId != null) {
      var data = await firestoreService.collection(path).doc(uId).get();
      return data.data();
    }
    if (subPath != null && uId != null) {
      var data = await firestoreService
          .collection(path)
          .doc(uId)
          .collection(subPath)
          .get();
      return data.docs.map((e) => e.data());
    } else {
      Query<Map<String, dynamic>> data = firestoreService.collection(path);
      if (query != null) {
        if (query['where'] != null) {
          var whereField = query['where'];
          var isEqualTo = query['isEqualTo'];
          data = data.where(whereField, isEqualTo: isEqualTo);
        }
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'] ?? false;
          data = data.orderBy(orderByField, descending: descending);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Stream<dynamic> getStreamData({
    required String path,
    String? uId,
    String? subPath,
    Map<String, dynamic>? query,
  }) async* {
    try {
      // الحالة 3: لا يوجد uId ولا subPath
      Query<Map<String, dynamic>> collectionRef =
          firestoreService.collection(path);

      if (query != null) {
        if (query['where'] != null && query['isEqualTo'] != null) {
          collectionRef = collectionRef.where(query['where'],
              isEqualTo: query['isEqualTo']);
        }

        if (query['orderBy'] != null) {
          collectionRef = collectionRef.orderBy(query['orderBy'],
              descending: query['descending'] ?? false);
        }
      }
      await for (var result in collectionRef.snapshots()) {
        yield result.docs.map((e) => e.data()).toList();
      }
    } catch (e) {
      yield* Stream.error(e);
    }
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

  @override
  Future<void> deleteData({required String path, required String uId}) async {
    await firestoreService.collection(path).doc(uId).delete();
  }
}
