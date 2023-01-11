import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc_template/features/features.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    // app stack
    AutoRoute<String>(
      path: SplashScreen.route,
      page: SplashScreen,
      initial: true,
    ),

    AutoRoute(
      page: HomeScreen,
      path: HomeScreen.route,
    ),
    RedirectRoute(
      path: '*',
      redirectTo: HomeScreen.route,
    ),
  ],
)

class $RootRouter {}
