import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    // final storage = GetIt.I.get<SecureStorage>();
    // final hasPassword = await storage.hasPassword();
    // final hasPinCode = await storage.hasPinCode();
    // if (!hasPassword) {
    //   router.popAndPush(const SelectLanguageRoute());
    // } else if(!hasPinCode) {
    //   router.popAndPush(const SetPinCodeWrapper());
    // }else{
    //   resolver.next();
    // }

    resolver.next();
  }
}
