import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:users_app/domain/entities/entities.dart';
import 'package:users_app/ui/utils/utils.dart';
import 'package:users_app/ui/widgets/widgets.dart';

class UserDetailsScreen extends ConsumerWidget {
  const UserDetailsScreen({
    super.key,
    required this.userResult,
  });

  final UserResult userResult;
  
  static Route goTo({required UserResult userResult}) => MaterialPageRoute(
    builder: ( _ ) => UserDetailsScreen(
      userResult: userResult,
    ),
    settings: const RouteSettings(name: kUserDestailsScreen)
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatBirtDay = DateFormat.yMMMMd('en_US');
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: MediaQuery.sizeOf(context).height*0.4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: userResult.userPicture!.large!,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                placeholder: (context, url) => Lottie.asset('assets/lotties_animation/loader.json'),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: MediaQuery.sizeOf(context).height*0.3,
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const CustomText(
                    text: "Personal Info", 
                    fontSize: 25, 
                    fontWeight: FontWeight.w400, 
                    color: Colors.black,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15,),
                  CustomRichText(
                    title: 'Name', 
                    subTitle: '${userResult.name!.title}. ${userResult.name!.first} ${userResult.name!.last}'
                  ),
                  const SizedBox(height: 15,),
                  CustomRichText(
                    title: 'Genre', 
                    subTitle: userResult.gender!.capitalize()
                  ),
                  const SizedBox(height: 15,),
                  CustomRichText(
                    title: 'Email',
                    subTitle: '${userResult.email}', 
                  ),
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                      _makePhoneCall(userResult.phone!);
                    },
                    child: Row(
                      children: [
                        CustomRichText(
                          title: 'Phone', 
                          subTitle: '${userResult.phone}', 
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                      _makePhoneCall(userResult.phone!);
                    },
                    child: Row(
                      children: [
                        CustomRichText(
                          title: 'Cell',
                          subTitle: '${userResult.cell}', 
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  CustomRichText(
                    title: 'Date of birth', 
                    subTitle: formatBirtDay.format(userResult.userDoB!.date!),
                  ),
                  const SizedBox(height: 15,),
                  CustomRichText(
                    title: 'Age', 
                    subTitle: userResult.userDoB!.age!.toString(),
                  ),
                  const SizedBox(height: 15,),
                  CustomRichText(
                    title: 'Country', 
                    subTitle: '${userResult.userLocation?.country}',
                  ),
                  const SizedBox(height: 15,),
                  CustomRichText(
                    title: 'State', 
                    subTitle: '${userResult.userLocation?.state}',
                  ),
                  const SizedBox(height: 15,),
                  CustomRichText(
                    title: 'Address', 
                    subTitle: '${userResult.userLocation?.street?.name} ${userResult.userLocation?.street?.number}',
                  ),
                  const SizedBox(height: 15,),
                  CustomRichText(
                    title: 'Postal Code', 
                    subTitle: '${userResult.userLocation?.postalCode}',
                  ),
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                        context: context, 
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)
                          )
                        ),
                        builder: (context) 
                        => CustomMap(
                          latitude: userResult.userLocation!.coordinates!.latitude!,
                          longitude: userResult.userLocation!.coordinates!.longitude!,
                        )
                      );
                    },
                    child: const Row(
                      children: [
                        CustomRichText(
                          title: 'See on the map', 
                          subTitle: '',
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20,)
                      ],
                    ),
                  ),
                ]
              )
            ),
          )
        ],
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    //Abrir la aplicacion de llamadas del celular
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

}

