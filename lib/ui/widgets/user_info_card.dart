import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:users_app/domain/entities/entities.dart';
import 'package:users_app/ui/utils/utils.dart';
import 'package:users_app/ui/widgets/widgets.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    super.key,
    required this.userResult,
  });
  final UserResult userResult;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: userResult.userPicture!.medium!,
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
                height: MediaQuery.sizeOf(context).height*.1,
                width: MediaQuery.sizeOf(context).height*.1,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: '${userResult.name!.title}. ${userResult.name!.first} ${userResult.name!.last}', 
                      fontSize: 16, 
                      fontWeight: FontWeight.w700, 
                      color: Colors.black
                    ),
                    CustomText(
                      text: userResult.gender!.capitalize(), 
                      fontSize: 14, 
                      fontWeight: FontWeight.w400, 
                      color: Colors.black
                    ),
                    CustomText(
                      text: '${userResult.email}', 
                      fontSize: 14, 
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      maxLines: 1,
                    ),
                    CustomText(
                      text: '${userResult.phone}', 
                      fontSize: 14, 
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}

