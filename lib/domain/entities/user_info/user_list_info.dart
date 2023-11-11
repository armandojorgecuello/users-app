
import 'package:equatable/equatable.dart';
import 'package:users_app/domain/entities/entities.dart';

class UsersListInfo extends Equatable{
  final List<UserResult>? result;
  final Info? info;

  const UsersListInfo({
    this.result, 
    this.info
  }); 

 
    @override
    List<Object?> get props => [
      result,
      info,
    ];
}