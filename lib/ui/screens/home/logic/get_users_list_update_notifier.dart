import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_app/data/models/result_model.dart';
import 'package:users_app/domain/entities/entities.dart';
import 'package:users_app/domain/usecase/get_users_list_usecase.dart';

class GetUsersListUpdatenotifier extends StateNotifier<ResultState<UsersListInfo,BackendError>>{

  final GetUsersListUseCase _getUsersListUseCase;

  GetUsersListUpdatenotifier({
    required GetUsersListUseCase getUsersListUseCase
    }) : _getUsersListUseCase = getUsersListUseCase, 
    super(ResultState.initial());

  Future<void> getUsersList({required String page}) async{
    state = ResultState.isLoading();
    final response = await _getUsersListUseCase.getUserList(page: page);
    state = response.when(
      fail: ResultState.error, 
      success: ResultState.data
    );
  }

  void updateList(UsersListInfo userInfo){
    if(state.data != null){
      List<UserResult>? usersList = state.data!.result! + userInfo.result!;
      state = state.copyWith(
        data: state.data!.copyWith(
          result: usersList,
          info: userInfo.info
        )
      );
    }
  }

}