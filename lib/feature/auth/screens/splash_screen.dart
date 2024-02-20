import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/feature/auth/presentation/screens/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState(){
    super.initState();
    navigate();
}

  void navigate (){
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.push(context, 
      MaterialPageRoute(builder:(context) =>  OnBoardingScreen(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.logo),
              const SizedBox(height: 24,),
               Text(AppStrings.appName, 
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 40
              ),)
            ],
          ),
        ),
      );
  }
}