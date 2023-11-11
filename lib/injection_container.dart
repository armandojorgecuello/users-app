import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_app/data/api_utils/api_utils.dart';
import 'package:users_app/data/data_source/users_data_source.dart';
import 'package:users_app/data/repository/user_repository_impl.dart';
import 'package:users_app/domain/usecase/get_users_list_usecase.dart';

final clientProvider = Provider((ref) 
  => Dio()
);

final usersApiProvider = Provider((ref) 
  => ApiUtils(
    client: ref.watch(clientProvider), 
    host: 'randomuser.me'
  )
);

final usersDataSourceProvider = Provider((ref) 
  => UsersDataSource(
    apiUtils: ref.watch(usersApiProvider)
  )
);

final usersRepositoryProvider = Provider((ref) 
  => ImplUsersRepository(
    usersDataSource: ref.watch(usersDataSourceProvider)
  )
);

final getUsersListUseCaseProvider = Provider((ref) 
  => GetUsersListUseCase(
    userRepository: ref.watch(usersRepositoryProvider)
  )
);