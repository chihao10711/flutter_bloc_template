class DataResponse<T> {
  late bool error;
  late T? data;
  late String message = '';
  late int? code;
  DataResponse({
    required this.error,
    required this.data,
    required this.message,
    this.code,
  });

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return DataResponse(
      message: json['message'] ?? '',
      data: json['data'] != null ? fromJsonT(json) : null,
      error: json['error'] ?? false,
      code: json['code'] ?? 0,
    );
    // error = json['error'] ?? false;
    // try {
    //   if (runtimeType is DataResponse<UserInfo>) {
    //     data = UserInfo.fromMap(json['data']) as T;
    //   } else {
    //     data = json['data'] ?? '';
    //   }
    // } catch (e) {
    //   logError(e);
    // }
    // message = json['message'] ?? '';
    // code = json['code'] ?? 0;
  }
}
