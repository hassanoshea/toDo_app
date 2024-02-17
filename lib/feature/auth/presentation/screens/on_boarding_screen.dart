import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_string.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //skip text
          TextButton(
          child: Text(AppStrings.skip, 
          style: TextStyle(
            fontSize: 16, 
             color: AppColors.white.withOpacity(.44),),),
             onPressed: (){},),
            //image
            Center(child: Image.asset(AppAssets.on1))
            //dots
            //title
            //subTitle
            //buttons
        ],
      ),
    ));
  }
}