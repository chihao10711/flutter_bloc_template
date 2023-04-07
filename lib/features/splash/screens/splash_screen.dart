// import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/router/router.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  static const route = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await Future.delayed(const Duration(seconds: 3));

    replaceRoute(const HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            Text("Splash screen"),
          ],
        ),
      ),
    );
  }
}
