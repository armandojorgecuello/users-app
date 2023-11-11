import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_app/domain/entities/entities.dart';

class SearchUpdateNotifier extends StateNotifier<List<UserResult>>{


  SearchUpdateNotifier():super([]);

  void onSearch({required String query, required List<UserResult> list}){
    state = [];
    if (query.isNotEmpty) {
      final result = list.where((element) {
        return '${element.name!.first!} ${element.name!.last}'.toLowerCase().contains(query.toLowerCase());
      }).toList();
      state.addAll(result);
    }else{
      state = [];
    }
  }

}