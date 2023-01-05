import '../../models/models.dart';

abstract class UserRepository {
  Future<DataResponse<UserInfo>> getUserInfo();
}
