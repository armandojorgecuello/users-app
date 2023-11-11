
import 'package:equatable/equatable.dart';
import 'package:users_app/data/models/models.dart';
import 'package:users_app/domain/entities/user_info/user_list_info.dart';

class UsersListInfoModel extends Equatable{
  final List<UserResultModel>? result;
  final InfoModel? info;

  const UsersListInfoModel({
    this.result, 
    this.info
  }); 

  factory UsersListInfoModel.fromJson(Map<String, dynamic> json)
    =>UsersListInfoModel(
      result: json['results'] != null ? List<UserResultModel>.from(json['results'].map((data)=>UserResultModel.fromJson(data))) : [],
      info: InfoModel.fromJson(json['info']),
    );

    UsersListInfo toEntity()
      => UsersListInfo(
        result:result?.map((e) => e.toEntity()).toList(),
        info: info?.toEntity()
      );
      
    @override
    List<Object?> get props => [
      result,
      info,
    ];
}