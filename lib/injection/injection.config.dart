// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_bloc_template/api/api.dart' as _i5;
import 'package:flutter_bloc_template/api/repository/impl/user_repository.dart'
    as _i6;
import 'package:flutter_bloc_template/api/rest_client_factory.dart' as _i4;
import 'package:flutter_bloc_template/hive/hive.dart' as _i7;
import 'package:flutter_bloc_template/hive/hive_storage.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.HiveStorage>(_i3.HiveStorage());
  gh.singleton<_i4.RestClientFactory>(_i4.RestClientFactory());
  gh.lazySingleton<_i5.UserRepository>(() => _i6.UserRepositoryImpl(
        gh<_i5.RestClientFactory>(),
        gh<_i7.HiveStorage>(),
      ));
  return getIt;
}
