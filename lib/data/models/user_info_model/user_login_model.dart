import 'package:equatable/equatable.dart';
import 'package:users_app/domain/entities/entities.dart';

class UserLoginModel extends Equatable{ 
  final String? username;

  const UserLoginModel({this.username});

  factory UserLoginModel.fromJson(Map<String, dynamic> json)
    =>UserLoginModel(
      username: json['username']
    );
  
  UserLogin toEntity()
    =>UserLogin(
      username:username
    );
    
  @override
  List<Object?> get props => [
    username,
  ];
}