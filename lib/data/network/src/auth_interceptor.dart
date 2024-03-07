import 'package:dio/dio.dart';

class AuthInterceptor extends InterceptorsWrapper {
  AuthInterceptor();

  final _apiKey = '1d09d5115amsh1d563755ede9540p1bcd85jsndc3cd2288da3';
  final _apiHost = 'deezerdevs-deezer.p.rapidapi.com';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['X-RapidAPI-Key'] = _apiKey;
    options.headers['X-RapidAPI-Host'] = _apiHost;
    handler.next(options);
  }
}
