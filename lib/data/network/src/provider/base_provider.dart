import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:music_app/data/network/response/base_response.dart';

abstract class BaseProvider {
  Future<ApiResponse<T>> apiCall<T>(
    Future<Response> request, {
    required T Function(dynamic data) dataFromJson,
    T? Function(dynamic errorData)? errorDataFromJson,
  }) async {
    try {
      final response = await request;
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse(
          dataFromJson(response.data),
          success: true,
        );
      }

      return ApiResponse(
        response.data,
        error: response.statusMessage,
        success: false,
      );
    } on DioException catch (e, s) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
        case DioExceptionType.badCertificate:
        case DioExceptionType.cancel:
          return ApiResponse<T>(
            null,
            success: false,
            error: e.response?.statusMessage,
          );
        case DioExceptionType.badResponse:
        case DioExceptionType.unknown:
          final errorData = e.response?.data;
          if (errorData != null) {
            log(
              'Error data DioErrorType.unknown data not null: $e ${e.response?.data} ${e.error} ${e.stackTrace}',
            );
            try {
              final errorResponse = ApiResponse.fromJson(
                errorData as Map<String, dynamic>,
                (data) => errorDataFromJson?.call(data),
              );

              return ApiResponse<T>(
                errorResponse.data,
                success: errorResponse.success,
                error: e.response?.statusMessage,
              );
            } catch (ee) {
              log(
                'Error data DioErrorType.unknown catch: $e ${e.response?.data} ${e.error} ${e.stackTrace}',
              );
              log(
                'Error data DioErrorType.unknown catch: $ee',
              );
              return ApiResponse(
                null,
                success: false,
                error: e.response?.statusMessage,
              );
            }
          }
          log(
            'Error data DioErrorType.unknown: $e ${e.response?.data} ${e.error} ${e.stackTrace}',
          );
          return ApiResponse(
            null,
            success: false,
            error: e.response?.statusMessage,
          );
      }
    }
  }
}
