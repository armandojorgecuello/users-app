import 'package:equatable/equatable.dart';

class UserCoordinates extends Equatable{
  final double? latitude;
  final double? longitude;

  const UserCoordinates({
    this.latitude, 
    this.longitude
  });
  
  @override
  List<Object?> get props => [
    latitude,
    longitude
  ];
}