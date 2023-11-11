
import 'package:equatable/equatable.dart';
import 'package:users_app/data/models/models.dart';
import 'package:users_app/domain/entities/entities.dart';

class UserResultModel extends Equatable {
  
  final String? gender;
  final UserNameModel? name;
  final UserLocationModel? userLocation;
  final String? email;
  final UserLoginModel? userLogin;
  final String? phone;
  final String? cell;
  final UserPictureModel? userPicture;
  final String? nat;
  final UserDobModel? userDoBModel;

  const UserResultModel({
    this.gender, 
    this.name, 
    this.userLocation, 
    this.email, 
    this.userLogin, 
    this.phone, 
    this.cell, 
    this.userPicture, 
    this.nat,
    this.userDoBModel
  });

  factory UserResultModel.fromJson(Map<String, dynamic> json)
    =>UserResultModel(
      gender: json['gender'],
      name: UserNameModel.fromJson(json['name']),
      userLocation: UserLocationModel.fromJson(json['location']),
      email: json['email'],
      userLogin: UserLoginModel.fromJson(json['login']),
      phone: json['phone'],
      cell: json['cell'],
      userPicture: UserPictureModel.fromJson(json['picture']),
      nat: json['nat'],
      userDoBModel: UserDobModel.fromJson(json['dob'])
    );

    UserResult toEntity()
      =>UserResult(
        gender: gender,
        name: name?.toEntity(),
        userLocation: userLocation?.toEntity(),
        email: email,
        userLogin: userLogin?.toEntity(),
        phone: phone,
        cell: cell,
        userPicture: userPicture?.toEntity(),
        nat: nat,
        userDoB: userDoBModel?.toEntity()
      );
      
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
        userDoBModel,
      ];

}