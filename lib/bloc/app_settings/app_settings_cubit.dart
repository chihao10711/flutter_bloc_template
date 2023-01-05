import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/hive/hive.dart';
import 'package:flutter_bloc_template/injection/injection.dart';

import 'bloc.dart';

class AppSettingsCubit extends Cubit<AppSettingState> {
  AppSettingsCubit() : super(const AppSettingState()) {
    _loadInit();
  }

  void toggleTheme() {
    ThemeMode themeModeToggle =
        state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(state.copyWith(themeMode: themeModeToggle));
  }

  void _loadInit() {
    String? localData = getIt<HiveStorage>().appSettings;
    if (localData == null) return;
    emit(AppSettingState.fromJson(localData));
  }

  @override
  void onChange(Change<AppSettingState> change) {
    super.onChange(change);
    getIt<HiveStorage>().updateAppSetting(change.nextState.toJson());
  }
}
