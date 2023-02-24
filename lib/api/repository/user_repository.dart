import '../../models/models.dart';

abstract class UserRepository {
  Future<BaseResponseModel<UserInfo>> getUserInfo();
}
