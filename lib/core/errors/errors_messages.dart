import 'custom_exception.dart';

abstract class ErrorsMessages {
  static const String cancellationMessage = 'تم إلغاء عملية تسجيل الدخول.';
  static const String genericErrorMessage =
      'لقد حدث خطأ ما. الرجاء المحاولة مرة أخرى.';

  static String getErrorMessage(dynamic error) {
    if (error is CustomException) {
      return error.message;
    }
    return genericErrorMessage;
  }

  static String getFirebaseErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'network-request-failed':
        return 'تاكد من اتصالك بالانترنت.';
      case 'user-disabled':
        return 'تم تعطيل حسابك.';
      case 'user-not-found':
        return 'لم يتم العثور على حسابك.';
      case 'wrong-password':
        return 'البريد الالكترونى او الرقم السري خطأ.';
      case 'invalid-email':
        return 'يرجي ادخال ايميل صحيح.';
      case 'email-already-in-use':
        return 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.';
      case 'weak-password':
        return 'الرقم السري ضعيف جداً.';
      case 'account-exists-with-different-credential':
        return 'حساب موجود بالفعل باستخدام بيانات اعتماد مختلفة.';

      default:
        return genericErrorMessage;
    }
  }
}
