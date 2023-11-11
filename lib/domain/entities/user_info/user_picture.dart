import 'package:equatable/equatable.dart';

class UserPicture extends Equatable {
  final String? large;
  final String? medium;
  final String? thumbnail;

  const UserPicture({
    this.large, 
    this.medium, 
    this.thumbnail
  });
  
  
  @override
  List<Object?> get props => [
    large,
    medium,
    thumbnail,
  ];



}