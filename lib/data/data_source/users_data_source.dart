
import 'package:users_app/data/api_utils/api_utils.dart';
import 'package:users_app/data/models/models.dart';

class UsersDataSource{

  final ApiUtils _apiUtils;

  UsersDataSource({
    required ApiUtils apiUtils
    }) : _apiUtils = apiUtils;
  
  Future<Result< UsersListInfoModel, BackendError>> getUserList(String page)async{
    
    const path = '/api';
    final queryParameter ={
      'page': page,
      'result': '10',
      'seed': 'abc'
    };
    
    Result<dynamic, BackendError> result = await _apiUtils.makeRequest(
      method: Method.get, 
      path: path,
      queryParameters: queryParameter
    );
    
    return result.when(
      fail: (fail) => Fail(fail), 
      success: (success) => Success(UsersListInfoModel.fromJson(success))
    );
  }

}