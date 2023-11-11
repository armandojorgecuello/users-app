import 'package:equatable/equatable.dart';

class UserStreet  extends Equatable{
  final int? number;
  final String? name;

  const UserStreet({
    this.number, 
    this.name
  });

  @override
  List<Object?> get props => [
    number,
    name,
  ];

}