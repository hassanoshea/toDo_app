import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_string.dart';

class OnBoardingModel {
  final String imagePath;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });
  static List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
        imagePath: AppAssets.on1,
        title: AppStrings.onBoardingTitle1,
        subTitle: AppStrings.onBoardingSubTitle1),
    OnBoardingModel(
        imagePath: AppAssets.on2,
        title: AppStrings.onBoardingTitle2,
        subTitle: AppStrings.onBoardingSubTitle2),
    OnBoardingModel(
        imagePath: AppAssets.on3,
        title: AppStrings.onBoardingTitle3,
        subTitle: AppStrings.onBoardingSubTitle3)
  ];
}
