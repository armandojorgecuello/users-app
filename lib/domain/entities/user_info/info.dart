import 'package:equatable/equatable.dart';

class Info extends Equatable {
 final String? seed;
 final int? result ;
 final int? page;

  const Info({
    this.seed, 
    this.result, 
    this.page
  });

  @override
  List<Object?> get props => [
    seed,
    result,
    page,
  ];

}