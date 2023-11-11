
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_app/data/models/result_model.dart';
import 'package:users_app/domain/entities/entities.dart';
import 'package:users_app/injection_container.dart';
import 'package:users_app/ui/screens/home/logic/get_users_list_update_notifier.dart';

final getUsersListProvider = StateNotifierProvider<GetUsersListUpdatenotifier,ResultState<UsersListInfo,BackendError>>(
  (ref) => GetUsersListUpdatenotifier(
    getUsersListUseCase: ref.watch(getUsersListUseCaseProvider)
  )
);

final isLoadingInitialList = StateProvider<bool>((ref) 
  => true
);