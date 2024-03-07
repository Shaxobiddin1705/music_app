import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:music_app/di/injector.config.dart';

GetIt get locator => GetIt.instance;

@InjectableInit()
void configureDependencies() => locator.init();
