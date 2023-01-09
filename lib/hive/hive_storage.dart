import 'package:flutter_bloc_template/share/utils/utils.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import 'hive.dart';
import 'hive_adapter.dart';

@singleton
class HiveStorage extends KeyStorage {
  late Box box;

  Future<void> init() async {
    logInfo("Init HiveStorage");
    await Hive.initFlutter();
    await Hive.openBox(boxKey);
    Hive.registerAdapter(ThemeModeAdapter());
    box = Hive.box(boxKey);
  }

  String get token => box.get(tokenKey, defaultValue: '');

  void updateToken(String value) => box.put(tokenKey, value);

  void clearToken() => box.delete(tokenKey);

  void updateAppSetting(String value) => box.put(appSettingKey, value);

  String? get appSettings => box.get(appSettingKey, defaultValue: null);
}
