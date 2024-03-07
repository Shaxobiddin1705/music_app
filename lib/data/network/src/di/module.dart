import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/data/network/src/auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  /// need secure base_url for example this package => flutter_dotenv
  @singleton
  @Named('base_url')
  String provideBaseUrl() => 'https://deezerdevs-deezer.p.rapidapi.com';

  @lazySingleton
  Dio provideDio(
    BaseOptions baseOptions,
    @Named('base_url') String baseUrl,
  ) {
    final dio = Dio(baseOptions..baseUrl = baseUrl);
    return dio
      ..interceptors.addAll([
        AuthInterceptor(),
        if (!kReleaseMode)
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            maxWidth: 150,
          ),
      ]);
  }

  BaseOptions baseOptions() => BaseOptions(
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        connectTimeout: const Duration(seconds: 10),
        contentType: Headers.jsonContentType,
      );
}
