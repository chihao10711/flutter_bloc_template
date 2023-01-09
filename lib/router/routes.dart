import 'package:flutter/material.dart';

import '../features/features.dart';

RouteFactory routes() {
  return (RouteSettings settings) {
    Widget? screen;

    final arguments = settings.arguments as Map<String, dynamic>? ?? {};
    var name = settings.name;
    switch (name) {
      case HomeScreen.route:
        screen = const HomeScreen();
        break;
      default:
        screen = const Scaffold(
          body: Center(
            child: Text("Not found"),
          ),
        );
    }

    return MaterialPageRoute(settings: settings, builder: (context) => screen!);
  };
}
