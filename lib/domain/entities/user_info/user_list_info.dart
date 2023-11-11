
import 'package:equatable/equatable.dart';
import 'package:users_app/domain/entities/entities.dart';

class UsersListInfo extends Equatable{
  final List<UserResult>? result;
  final Info? info;

  const UsersListInfo({
    this.result, 
    this.info
  }); 

    UsersListInfo copyWith({
      List<UserResult>? result,
      Info? info,
    }){
      return UsersListInfo(
        result: result ?? this.result,
        info: info ?? this.info
      );
    }

    @override
    List<Object?> get props => [
      result,
      info,
    ];
}