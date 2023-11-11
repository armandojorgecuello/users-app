import 'package:equatable/equatable.dart';
import 'package:users_app/domain/entities/entities.dart';

class InfoModel extends Equatable {
 final String? seed;
 final int? result ;
 final int? page;

  const InfoModel({
    this.seed, 
    this.result, 
    this.page
  });

  factory InfoModel.fromJson(Map<String, dynamic>json)
    =>InfoModel(
      seed: json['seed'],
      result: json['reuslt'],
      page: json['page'],
    );

  Info toEntity()
    =>Info(
      seed:seed,
      result:result,
      page:page
    );
    
    @override
    List<Object?> get props => [
      seed,
      result,
      page,
    ];

}