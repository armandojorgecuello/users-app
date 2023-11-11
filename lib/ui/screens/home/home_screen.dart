import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_app/ui/screens/home/logic/home_providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  ScrollController scrollController = ScrollController();
  int page = 1;

  Future _fetchData (int page){
    return ref.read(getUsersListProvider.notifier).getUsersList(page: page.toString());
  }

  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      _fetchData(page).then((value) {
        if(ref.read(getUsersListProvider).data != null){
          page++;
          ref.read(isLoadingInitialList.notifier).update((state)=> false);
          log(ref.read(getUsersListProvider).data.toString());
        }
      });
    });
    scrollController.addListener(() { 
      final isLoading = ref.watch(getUsersListProvider).isLoading!;
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 300 && !isLoading ){
        _fetchData(page).then((value) {
          if(ref.read(getUsersListProvider).data != null){
            page++;
            log(ref.read(getUsersListProvider).data.toString());
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User List',
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: ref.watch(isLoadingInitialList) 
      ? Center(
        child: Platform.isAndroid ? const CircularProgressIndicator() : const CupertinoActivityIndicator(),
      ) 
      : const CustomScrollView(
        slivers: [
          
        ],
      ) ,
    );
  }
}