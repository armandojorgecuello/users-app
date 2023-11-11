
import 'package:equatable/equatable.dart';
import 'package:users_app/domain/entities/entities.dart';

class UserLocation extends Equatable{
  final UserStreet? street;
  final String? city;
  final String? state;
  final String? country;
  final String? postalCode;
  final UserCoordinates? coordinates;

  const UserLocation({
    this.street, 
    this.city, 
    this.state, 
    this.country, 
    this.postalCode, 
    this.coordinates
  });
    
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