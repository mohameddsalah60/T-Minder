abstract class DatabaseService {
  Future<void> addData({
    String? docId,
    required String path,
    required Map<String, dynamic> data,
  });
  Future<Map<String, dynamic>> getData({
    required String path,
    required String uId,
  });

  Future<bool> checkIfDataExists({
    required String path,
    required String docId,
  });
}
