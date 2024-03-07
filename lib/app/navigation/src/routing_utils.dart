import 'package:get_it/get_it.dart';
import 'package:music_app/app/navigation/src/app_navigators/main_navigation.dart';

mixin RoutingUtils {
  static MainNavigator getMainNavigator() {
    return GetIt.I.get<MainNavigator>();
  }
}
