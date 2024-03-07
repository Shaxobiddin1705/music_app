import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  ApiResponse(
    this.data, {
    this.error,
    required this.success,
  });

  final T? data;
  final String? error;
  @JsonKey(defaultValue: false)
  final bool success;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? data) fromJsonT,
  ) {
    return _$ApiResponseFromJson<T>(json, fromJsonT);
  }
}
