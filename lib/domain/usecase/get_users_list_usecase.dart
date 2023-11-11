
import 'package:users_app/data/models/models.dart';
import 'package:users_app/domain/entities/entities.dart';
import 'package:users_app/domain/repository/user_repository.dart';

class GetUsersListUseCase {
  final UserRepository _userRepository;

  GetUsersListUseCase({
    required UserRepository userRepository
  }) : _userRepository = userRepository;

  Future<Result<UsersListInfo, BackendError>> getUserList({required String page})async{
    return await _userRepository.getUserList(page: page);
  }

}