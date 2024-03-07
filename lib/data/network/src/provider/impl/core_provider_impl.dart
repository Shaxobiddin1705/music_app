import 'package:dio/dio.dart';
import 'package:music_app/data/network/response/base_response.dart';
import 'package:music_app/data/network/src/provider/core_provider.dart';

class CoreProviderImpl extends CoreProvider {
  final Dio apiClient;

  CoreProviderImpl(this.apiClient);

  @override
  Future<ApiResponse<dynamic>> downloadFile(String url, String path) async {
    try {
      final response = await apiClient.download(url, path);
      return ApiResponse(response.data, success: true);
    } on DioException catch (e) {
      return ApiResponse(
        e.response,
        success: false,
        error: e.message,
      );
    }
  }
}
