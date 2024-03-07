import 'package:music_app/data/network/response/base_response.dart';
import 'package:music_app/data/network/src/provider/base_provider.dart';

abstract class CoreProvider extends BaseProvider {
  Future<ApiResponse<dynamic>> downloadFile(String url, String path);
}
