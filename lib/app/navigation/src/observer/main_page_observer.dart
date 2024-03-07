import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MainPageObserver extends AutoRouterObserver {
  final Function(String name) onRouteChange;

  MainPageObserver({required this.onRouteChange});

  @override
  void didPush(Route route, Route? previousRoute) {
    log('another app route New route pushed: ${route.settings.name}');
    onRouteChange.call(route.settings.name ?? '');
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    log('another app route Tab route visited: ${route.name}');
    onRouteChange.call(route.name);
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    log('another app route Tab route re-visited: ${route.name} and ${route.routeInfo}');
    onRouteChange.call(route.name);
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log('another app route Route popped: ${previousRoute?.settings.name}');
    onRouteChange.call(previousRoute?.settings.name ?? '');
    super.didPop(route, previousRoute);
  }
}
