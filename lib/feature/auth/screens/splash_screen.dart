import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
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
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder:(context) => const OnBoardingScreen(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.logo),
              const SizedBox(height: 24,),
              const Text(AppStrings.appName, 
              style: TextStyle(fontSize: 40,
              fontWeight: FontWeight.bold, 
              color: AppColors.white),)
            ],
          ),
        ),
      );
  }
}