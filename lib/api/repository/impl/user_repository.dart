import 'package:dio/dio.dart';
import 'package:flutter_bloc_template/models/base_response/data_response.dart';
import 'package:flutter_bloc_template/models/response_model/user_info_response.dart';
import 'package:injectable/injectable.dart';

import '../../../hive/hive.dart';
import '../../api.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final TokenRestClient _tokenRestClient;
  final RestClient _restClient;
  final HiveStorage hiveService;
  final Dio dio;

  UserRepositoryImpl(
    RestClientFactory factory,
    this.hiveService,
  )   : dio = factory.obtainTokenDio(),
        _restClient = factory.obtainRestClient(),
        _tokenRestClient = factory.obtainTokenRestClient();

  @override
  Future<DataResponse<UserInfo>> getUserInfo() {
    return _tokenRestClient.getUserInfo();
  }
}
