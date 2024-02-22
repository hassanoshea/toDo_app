
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_string.dart';

class OnBoardingModel {
  final String imgPath;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.imgPath,
    required this.title,
    required this.subTitle,
  });
  static List<OnBoardingModel> onBoardingScreens = [
    OnBoardingModel(
        imgPath: AppAssets.on1,
        title: AppStrings.onBoardingTitle1,
        subTitle: AppStrings.onBoardingSubTitle1),
    OnBoardingModel(
        imgPath: AppAssets.on2,
        title: AppStrings.onBoardingTitle2,
        subTitle: AppStrings.onBoardingSubTitle2),
    OnBoardingModel(
        imgPath: AppAssets.on3,
        title: AppStrings.onBoardingTitle3,
        subTitle: AppStrings.onBoardingSubTitle3),
  ];
}