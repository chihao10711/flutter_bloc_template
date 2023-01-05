import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/features/home/screens/screens.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bloc/bloc.dart';
import 'hive/hive.dart';
import 'injection/injection.dart';
import 'router/navigator_utils.dart';
import 'router/routes.dart';
import 'theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();

  await getIt<HiveStorage>().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppSettingsCubit(),
        ),
      ],
      child: BlocBuilder<AppSettingsCubit, AppSettingState>(
        builder: (context, state) {
          return MaterialApp(
            title: "Flutter bloc template",
            navigatorKey: NavigatorUtils.navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeDataExt.build(state.themeMode),
            initialRoute: HomeScreen.homeScreen,
            onGenerateRoute: routes(),
            navigatorObservers: [NavigatorUtils.routeObserver],
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            locale: state.locale,
            builder: (context, child) {
              return child ?? const SizedBox();
            },
          );
        },
      ),
    );
  }
}
