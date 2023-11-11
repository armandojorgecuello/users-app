import 'dart:io';
import 'dart:math';

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
  List<UserResult> usersListToDisplay = [];

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
          usersListToDisplay = ref.read(getUsersListProvider).data!.result!;
          ref.read(isLoadingInitialList.notifier).update((state)=> false);
        }else{
          if(ref.read(getUsersListProvider).error != null){
            ref.read(isLoadingInitialList.notifier).update((state)=> false);
          }
        }
      });
    });
    scrollController.addListener(() { 
      final isLoading = ref.watch(getUsersListProvider).isLoading;
      //Validacion para cuando el scroll llegue a la maxima extension configurada se lance la peticion para obtener mas información
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 300 && !isLoading){
        //Obtener las paginas siguientes
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
    if (ref.watch(searchProvider).isNotEmpty) {
      usersListToDisplay = ref.watch(searchProvider);
    }else{
      usersListToDisplay = usersList;
    }
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.blue[800],
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10,),
                  child: SearchBar(
                    trailing: const [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(Icons.search)
                      )
                    ],
                    hintText: "Type your search here",
                    onChanged: (query){
                      ref.read(searchProvider.notifier).onSearch(
                        query: query, 
                        list: usersList
                      );
                    },
                  ),
                ),
              )
            ),
            ref.watch(isLoadingInitialList)
            ? SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height*.9,
                width: MediaQuery.sizeOf(context).width,
                child: Center(
                  child: Platform.isAndroid ? const CircularProgressIndicator(
                    color: Colors.white,
                  ) : const CupertinoActivityIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            ) 
            : 
            usersListToDisplay.isNotEmpty ? SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 20,
                  left: 16,
                  right: 16,
                ),
                child: ElevatedButton(
                  style:  ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    )
                  ),
                  onPressed: (){
                    ref.read(isLoadingInitialList.notifier).update((state)=> true);
                    final random = Random();
                    final randomPage = random.nextInt(8);
                    _fetchData(randomPage).then((value) {
                      if(ref.read(getUsersListProvider).data != null){
                        page = randomPage;
                        page++;
                        usersList = ref.read(getUsersListProvider).data!.result!;
                        usersListToDisplay = ref.read(getUsersListProvider).data!.result!;
                        ref.read(isLoadingInitialList.notifier).update((state)=> false);
                      }else{
                        fetchDataErrorDialog(
                            context,
                            ref.read(getUsersListProvider).error?.description ?? ''
                          );
                        if(ref.read(getUsersListProvider).error != null){
                          ref.read(isLoadingInitialList.notifier).update((state)=> false);
                          fetchDataErrorDialog(
                            context,
                            ref.read(getUsersListProvider).error?.description ?? ''
                          );
                        }
                      }
                    });
                  },
                  child: const CustomText(
                    text: "Refresh List", 
                    fontSize: 20, 
                    fontWeight: FontWeight.w700, 
                    color: Colors.black
                  )
                ),
              ),
            ) : const SliverToBoxAdapter(
              child: SizedBox(
                child: Center(
                  child: CustomText(
                    text: "There have been no coincidences", 
                    fontSize: 20, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.white
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [ 
                  ...(usersListToDisplay).map((userResult)
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
        ),
      )
    );
  }
}