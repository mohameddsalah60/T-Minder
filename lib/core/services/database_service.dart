abstract class DatabaseService {
  Future<void> addData({
    String? docId,
    required String path,
    String? subPath,
    required Map<String, dynamic> data,
  });
  Future<dynamic> getData({
    required String path,
    String? uId,
    String? subPath,
    Map<String, dynamic>? query,
  });

  Future<bool> checkIfDataExists({
    required String path,
    required String docId,
  });
  Future<void> updateData({
    required String path,
    required String uId,
    required Map<String, dynamic> value,
  });
  Future<void> deleteData({
    required String path,
    required String uId,
  });
}
