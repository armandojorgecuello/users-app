import 'package:equatable/equatable.dart';
import 'package:users_app/domain/entities/entities.dart';

class UserStreetModel  extends Equatable{
  final int? number;
  final String? name;

  const UserStreetModel({
    this.number, 
    this.name
  });

  factory UserStreetModel.fromJson(Map<String, dynamic>json)
    =>UserStreetModel(
      number: json['number'],
      name: json['name']
    );

  UserStreet toEntity()
    =>UserStreet(
      number:number,
      name:name,
    );
    
  @override
  List<Object?> get props => [
    number,
    name,
  ];

}