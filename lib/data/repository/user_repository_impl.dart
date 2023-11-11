

import 'package:users_app/data/data_source/users_data_source.dart';
import 'package:users_app/data/models/result_model.dart';
import 'package:users_app/domain/entities/user_info/user_list_info.dart';
import 'package:users_app/domain/repository/user_repository.dart';

class ImplUsersRepository implements UserRepository{
  

  ImplUsersRepository({
    required UsersDataSource usersDataSource
  }) : _usersDataSource = usersDataSource;
  final UsersDataSource _usersDataSource;

  @override
  Future<Result<UsersListInfo, BackendError>> getUserList({required String page}) async{
    final result = await _usersDataSource.getUserList(page);
    return result.when(
      fail: (fail)=>Fail(fail), 
      success: (success)=>Success(success.toEntity())
    );
  }

}