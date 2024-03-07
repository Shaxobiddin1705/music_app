import 'dart:async';
import 'dart:developer';
import 'package:music_app/data/core/result.dart';
import 'package:music_app/data/network/response/base_response.dart';

abstract class BaseRepository {
  Future<Result<DATA>> toResult2<DATA, RESPONSE extends ApiResponse>(
    Future<RESPONSE> future, {
    required FutureOr<DATA> Function(RESPONSE response) fromSuccessResponse,
  }) async {
    try {
      final response = await future;
      if (response.success) {
        final data = await fromSuccessResponse.call(response);
        return Result.completed(data);
      }
      return Result.error(response.error);
    } catch (e) {
      log('********Error******** \n $e');
      return Result.error('Something is wrong, please try again');
    }
  }
}
