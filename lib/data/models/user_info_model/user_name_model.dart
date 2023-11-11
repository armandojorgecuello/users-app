
import 'package:equatable/equatable.dart';
import 'package:users_app/domain/entities/entities.dart';

class UserNameModel extends Equatable {
  final String? title;
  final String? first;
  final String? last;

  const UserNameModel({
    this.title, 
    this.first, 
    this.last
  });

  factory UserNameModel.fromJson(Map<String, dynamic> json)
    =>UserNameModel(
      title:json["title"],
      first:json["first"],
      last:json["last"],
    );

    UserName toEntity()
      =>UserName(
        title:title,
        first:first,
        last:last,
      );
      
      @override
      List<Object?> get props => [
        title,
        first,
        last,
      ];
  
}