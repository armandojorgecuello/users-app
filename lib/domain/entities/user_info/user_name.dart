
import 'package:equatable/equatable.dart';

class UserName extends Equatable {
  final String? title;
  final String? first;
  final String? last;

  const UserName({
    this.title, 
    this.first, 
    this.last
  });
  
  @override
  List<Object?> get props => [
    title,
    first,
    last,
  ];
  
}