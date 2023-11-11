
import 'package:equatable/equatable.dart';
import 'package:users_app/data/models/models.dart';
import 'package:users_app/domain/entities/entities.dart';

class UserLocationModel extends Equatable{
  final UserStreetModel? street;
  final String? city;
  final String? state;
  final String? country;
  final String? postalCode;
  final UserCoordinatesModel? coordinates;

  const UserLocationModel({
    this.street, 
    this.city, 
    this.state, 
    this.country, 
    this.postalCode, 
    this.coordinates
  });

  factory UserLocationModel.fromJson(Map<String, dynamic>json)
    =>UserLocationModel(
      street: UserStreetModel.fromJson(json['street']),
      city:json['city'],
      state:json['state'],
      country:json['country'],
      postalCode:json['postcode'].toString(),
      coordinates: UserCoordinatesModel.fromJson(json['coordinates']),
    );

  UserLocation toEntity()
    =>UserLocation(
      street:street?.toEntity(),
      city:city,
      state:state,
      country:country,
      postalCode:postalCode,
      coordinates:coordinates?.toEntity(),
    );
    
    @override
    List<Object?> get props => [
      street,
      city,
      state,
      country,
      postalCode,
      coordinates,
    ];

}