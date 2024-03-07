import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:music_app/app/design_system/styles/theme/theme.dart';
import 'package:music_app/app/navigation/app_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final appRouter = GetIt.I.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: MyAppTheme.lightTheme,
      // locale: context.locale,
      // supportedLocales: context.supportedLocales,
      // localizationsDelegates: context.localizationDelegates,
      routerConfig: appRouter.config(),
      // routerDelegate: appRouter.delegate(
      //   navigatorObservers: () => [AppRouteObserver()],
      // ),
      // routeInformationParser:
      //     appRouter.defaultRouteParser(includePrefixMatches: true),
    );
  }
}
