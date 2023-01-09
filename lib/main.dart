import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/features/home/screens/screens.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'base_widgets/base_widgets.dart';
import 'bloc/bloc.dart';
import 'hive/hive.dart';
import 'injection/injection.dart';
import 'router/navigator_utils.dart';
import 'router/routes.dart';
import 'share/share.dart';
import 'theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();

  await getIt<HiveStorage>().init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    NetworkConnectivity().init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppSettingsCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (BuildContext context, _) {
          AppSettingState state = context.watch<AppSettingsCubit>().state;
          return MaterialApp(
            title: "Flutter bloc template",
            navigatorKey: NavigatorUtils.navigatorKey,
            scaffoldMessengerKey: scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeDataExt.build(state.themeMode),
            initialRoute: HomeScreen.route,
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
