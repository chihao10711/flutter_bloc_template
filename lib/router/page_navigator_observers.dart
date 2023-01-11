import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/share/share.dart';

class PageNavigatorObservers extends AutoRouterObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings is AutoRoutePage &&
        previousRoute?.settings is AutoRoutePage) {
      logInfo('🚚 ${route.settings.name} didPop');
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings is AutoRoutePage &&
        previousRoute?.settings is AutoRoutePage) {
      String? routeName = route.settings.name;
      String? previousRouteName = previousRoute?.settings.name;
      Object? arguments = route.settings.arguments;
      String argumentsStringify = arguments != null
          ? ', with argument: ${route.settings.arguments}'
          : '';
      logInfo('🚚 $previousRouteName push to $routeName$argumentsStringify');
    }
  }
}
