import 'package:equatable/equatable.dart';
import 'package:users_app/domain/entities/entities.dart';

class UserPictureModel extends Equatable {
  final String? large;
  final String? medium;
  final String? thumbnail;

  const UserPictureModel({
    this.large, 
    this.medium, 
    this.thumbnail
  });
  
  factory UserPictureModel.fromJson(Map<String, dynamic>json)
    =>UserPictureModel(
      large:json['large'] ,
      medium:json['medium'] ,
      thumbnail:json['thumbnail'] 
    );

  UserPicture toEntity()
    =>UserPicture(
      large:large,
      medium:medium,
      thumbnail:thumbnail,
    );
    
  @override
  List<Object?> get props => [
    large,
    medium,
    thumbnail,
  ];



}