import 'package:flutter/material.dart';
import 'package:to_do_app/core/database/cashe_helper.dart';
import 'package:to_do_app/core/service/service_locator.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/feature/auth/presentation/screens/on_boarding_screen.dart';
import 'package:to_do_app/feature/task/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async{
    bool isVisted = await sl<CacheHelper>().getData(
          key: AppStrings.onBoardingKey,
        ) ??
        false;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => isVisted ? const HomeScreen() : OnBoaringScreens(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: Center (child: Image.asset(AppAssets.logo),)
    );
  }
}
