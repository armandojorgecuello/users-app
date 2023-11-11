import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:users_app/ui/screens/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4,milliseconds: 500), (){
      Navigator.push(context, HomeScreen.goTo());
    });
    return Scaffold(
      body: Center(
        child:Lottie.asset('assets/lotties_animation/welcome.json')
      ),
    );
  }
}