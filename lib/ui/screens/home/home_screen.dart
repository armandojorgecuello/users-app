import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_app/domain/entities/entities.dart';
import 'package:users_app/ui/screens/home/logic/home_providers.dart';
import 'package:users_app/ui/screens/user_details/user_details_screen.dart';
import 'package:users_app/ui/utils/utils.dart';
import 'package:users_app/ui/widgets/widgets.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static Route goTo() => MaterialPageRoute(
    builder: ( _ ) => const HomeScreen(),
    settings: const RouteSettings(name: kHomeScree)
  );

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  ScrollController scrollController = ScrollController();
  int page = 1;
  List<UserResult> usersList = [];

  Future _fetchData (int page){
    return ref.read(getUsersListProvider.notifier).getUsersList(page: page.toString());
  }

  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      // Obtener los primeras 10 usuarios al iniciar la pantalla del Home
      ref.read(isLoadingInitialList.notifier).update((state)=> true);
      _fetchData(page).then((value) {
        if(ref.read(getUsersListProvider).data != null){
          page++;
          usersList = ref.read(getUsersListProvider).data!.result!;
          ref.read(isLoadingInitialList.notifier).update((state)=> false);
        }else{
          if(ref.read(getUsersListProvider).error != null){
            ref.read(isLoadingInitialList.notifier).update((state)=> false);
            //Mostrar aqui el error
          }
        }
      });
    });
    scrollController.addListener(() { 
      final isLoading = ref.watch(getUsersListProvider).isLoading;
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 300 && !isLoading){
        _fetchData(page).then((value) {
          if(ref.read(getUsersListProvider).data != null){
            page++;
            usersList.addAll(ref.read(getUsersListProvider).data!.result!);
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'User List',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30
          ),
        ),
      ),
      body: ref.watch(isLoadingInitialList)
      ? Center(
        child: Platform.isAndroid ? const CircularProgressIndicator() : const CupertinoActivityIndicator(),
      ) 
      : usersList.isNotEmpty ? CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ...(usersList).map((userResult)
                  => InkWell(
                    onTap: (){
                      Navigator.push(context, UserDetailsScreen.goTo(userResult: userResult));
                    },
                    child: UserInfoCard(
                      userResult: userResult,
                    ),
                  )
                )
              ]
            )
          )
        ],
      ) : const SizedBox() ,
    );
  }
}