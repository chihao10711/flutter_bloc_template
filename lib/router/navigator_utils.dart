import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/injection/injection.dart';

import 'router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

BuildContext get _context => navigatorKey.currentContext!;

StackRouter get router => getIt<RootRouter>();

@optionalTypeArgs
Future<T?> pushRoute<T extends Object?>(
  PageRouteInfo route, {
  OnNavigationFailure? onFailure,
}) =>
    router.push<T>(route, onFailure: onFailure);

@optionalTypeArgs
Future<T?> replaceRoute<T extends Object?>(
  PageRouteInfo route, {
  OnNavigationFailure? onFailure,
}) =>
    router.replace<T>(route, onFailure: onFailure);

@optionalTypeArgs
Future<bool> popRoute<T extends Object?>([T? result]) => router.pop<T>(result);

Future<void> navigateTo(
  PageRouteInfo route, {
  OnNavigationFailure? onFailure,
}) =>
    RouterScope.of(_context).controller.navigate(
          route,
          onFailure: onFailure,
        );

void navigateBack() => RouterScope.of(_context).controller.navigateBack();

Future<void> navigateNamedTo(
  String path, {
  bool includePrefixMatches = false,
  OnNavigationFailure? onFailure,
}) =>
    RouterScope.of(_context).controller.navigateNamed(
          path,
          includePrefixMatches: includePrefixMatches,
          onFailure: onFailure,
        );

RouteData get routeData => RouteData.of(_context);
