import 'package:equatable/equatable.dart';
import 'package:users_app/domain/entities/entities.dart';

class UserCoordinatesModel extends Equatable{
  final double? latitude;
  final double? longitude;

  const UserCoordinatesModel({
    this.latitude, 
    this.longitude
  });

  factory UserCoordinatesModel.fromJson(Map<String, dynamic>json)
    =>UserCoordinatesModel(
      latitude: double.parse(json['latitude'] ?? '0'),
      longitude: double.parse(json['longitude'] ?? '0')
    );

  UserCoordinates toEntity()
    =>UserCoordinates(
      latitude:latitude,
      longitude:longitude
    );
    
      @override
      List<Object?> get props => [
        latitude,
        longitude
      ];
}