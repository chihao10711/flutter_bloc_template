import 'package:json_annotation/json_annotation.dart';

part 'data_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseListResponseModel<T> {
  factory BaseListResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$BaseListResponseModelFromJson<T>(json, fromJsonT);
  }
  BaseListResponseModel({this.code, this.success, this.totalCount, this.data});

  final int? code;
  final bool? success;
  final int? totalCount;
  final List<T>? data;
}

@JsonSerializable(genericArgumentFactories: true)
class BaseResponseModel<T> {
  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$BaseResponseModelFromJson<T>(json, fromJsonT);
  }
  BaseResponseModel({this.code, this.success, this.data});

  final int? code;
  final bool? success;
  final T? data;
}
