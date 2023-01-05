import '../models.dart';

class DataResponse<T> {
  late bool error;
  late T data;
  late String message = '';
  late int? code;
  DataResponse({
    required this.error,
    required this.data,
    required this.message,
    this.code,
  });

  DataResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'] ?? false;
    try {
      if (runtimeType is DataResponse<UserInfo>) {
        data = UserInfo.fromMap(json['data']) as T;
      } else {
        data = json['data'] ?? '';
      }
    } catch (e) {
      print(e);
    }
    message = json['message'] ?? '';
    code = json['code'] ?? 0;
  }
}
