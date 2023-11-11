
import 'package:equatable/equatable.dart';
import 'package:users_app/data/models/models.dart';
import 'package:users_app/domain/entities/entities.dart';

class UserResultModel extends Equatable {
  
  final String? genger;
  final UserNameModel? name;
  final UserLocationModel? userLocation;
  final String? email;
  final UserLoginModel? userLogin;
  final String? phone;
  final String? cell;
  final UserPictureModel? userPicture;
  final String? nat;

  const UserResultModel({
    this.genger, 
    this.name, 
    this.userLocation, 
    this.email, 
    this.userLogin, 
    this.phone, 
    this.cell, 
    this.userPicture, 
    this.nat
  });

  factory UserResultModel.fromJson(Map<String, dynamic> json)
    =>UserResultModel(
      genger: json['genger'],
      name: json['name'],
      userLocation: json['location'],
      email: json['email'],
      userLogin: json['login'],
      phone: json['phone'],
      cell: json['cell'],
      userPicture: json['picture'],
      nat: json['nat'],
    );

    UserResult toEntity()
      =>UserResult(
        genger: genger,
        name: name?.toEntity(),
        userLocation: userLocation?.toEntity(),
        email: email,
        userLogin: userLogin?.toEntity(),
        phone: phone,
        cell: cell,
        userPicture: userPicture?.toEntity(),
        nat: nat,
      );
      
      @override
      List<Object?> get props => [
        genger,
        name,
        userLocation,
        email,
        userLogin,
        phone,
        cell,
        userPicture,
        nat,
      ];

}