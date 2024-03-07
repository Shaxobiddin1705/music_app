import 'package:injectable/injectable.dart';
import 'package:music_app/data/network/network.dart';
import 'package:music_app/data/network/src/provider/impl/album_provider_impl.dart';
import 'package:music_app/data/network/src/provider/impl/core_provider_impl.dart';

@module
abstract class ProviderModule {
  AlbumProvider provideAlbumProvider(Dio apiClient) {
    return AlbumProviderImpl(apiClient);
  }

  CoreProvider provideCoreProvider(Dio apiClient) {
    return CoreProviderImpl(apiClient);
  }
}
