import 'package:equatable/equatable.dart';
import 'package:users_app/domain/entities/entities.dart';

class UserDobModel extends Equatable {
    final DateTime? date;
    final int? age;

    const UserDobModel({
        this.date,
        this.age,
    });

    factory UserDobModel.fromJson(Map<String, dynamic> json) => UserDobModel(
        date: DateTime.parse(json["date"]),
        age: json["age"],
    );
    
    UserDob toEntity()
      =>UserDob(
        date:date,
        age:age,
      );

      @override
      List<Object?> get props => [
        date,
        age,
      ];

}