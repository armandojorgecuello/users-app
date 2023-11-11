
import 'package:equatable/equatable.dart';
import 'package:users_app/domain/entities/entities.dart';

class UserResult extends Equatable {
  
  final String? gender;
  final UserName? name;
  final UserLocation? userLocation;
  final String? email;
  final UserLogin? userLogin;
  final String? phone;
  final String? cell;
  final UserPicture? userPicture;
  final String? nat;
  final UserDob? userDoB;

  const UserResult({
    this.gender, 
    this.name, 
    this.userLocation, 
    this.email, 
    this.userLogin, 
    this.phone, 
    this.cell, 
    this.userPicture, 
    this.nat,
    this.userDoB
  });

  @override
  List<Object?> get props => [
    gender,
    name,
    userLocation,
    email,
    userLogin,
    phone,
    cell,
    userPicture,
    nat,
    userDoB,
  ];

}