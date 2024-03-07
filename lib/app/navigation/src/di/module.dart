import 'package:injectable/injectable.dart';
import 'package:music_app/app/navigation/app_router.dart';
import 'package:music_app/app/navigation/src/app_navigators/impl/main_navigation_impl.dart';
import 'package:music_app/app/navigation/src/app_navigators/main_navigation.dart';
import 'package:music_app/app/navigation/src/app_routes/impl/main_routes_impl.dart';
import 'package:music_app/app/navigation/src/app_routes/main_router.dart';
import 'package:music_app/app/navigation/src/guard/auth_guard.dart';

@module
abstract class NavigatorModule {
  @singleton
  AuthGuard provideAuthGuard() {
    return AuthGuard();
  }

  @singleton
  AppRouter provideAppRouter() {
    return AppRouter();
  }

  @lazySingleton
  MainNavigator provideMainNavigator(AppRouter appRouter) {
    return MainNavigatorImpl(appRouter);
  }

  @lazySingleton
  MainRoutes provideMainRoutes() {
    return MainRoutesImpl();
  }
}
