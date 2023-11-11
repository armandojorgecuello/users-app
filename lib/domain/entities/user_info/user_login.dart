import 'package:equatable/equatable.dart';

class UserLogin extends Equatable{ 
  final String? username;

  const UserLogin({this.username});

  @override
  List<Object?> get props => [
    username,
  ];
}