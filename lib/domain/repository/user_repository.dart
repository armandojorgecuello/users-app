
import 'package:users_app/data/models/result_model.dart';
import 'package:users_app/domain/entities/entities.dart';

abstract class UserRepository{

  Future<Result<UsersListInfo, BackendError>> getUserList({required String page});

}