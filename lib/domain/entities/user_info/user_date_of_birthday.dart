import 'package:equatable/equatable.dart';

class UserDob extends Equatable {
    final DateTime? date;
    final int? age;

    const UserDob({
        this.date,
        this.age,
    });
    
    @override
    List<Object?> get props => [
      date,
      age,
    ];

}