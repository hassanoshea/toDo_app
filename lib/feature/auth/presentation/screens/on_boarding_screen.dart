import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/commons/commons.dart';
import 'package:to_do_app/core/database/cashe_helper.dart';
import 'package:to_do_app/core/service/service_locator.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app/core/widgets/custom_text_button.dart';
import 'package:to_do_app/feature/auth/data/model/on_boarding_model.dart';
import 'package:to_do_app/feature/task/presentation/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class OnBoaringScreens extends StatelessWidget {
  OnBoaringScreens({super.key});

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: PageView.builder(
              controller: controller,
              itemCount: OnBoardingModel.onBoardingList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    //skip text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        index != 2
                            ? CustomTextButton(
                                text: AppStrings.skip,
                                onPressed: () {
                                  controller.jumpToPage(2);
                                },
                              )
                            : SizedBox(height: 10.h),
                      ],
                    ),
                    index != 2
                        ? SizedBox(height: 20.h)
                        : SizedBox(height: 50.h),
                    //image
                    Center(
                        child: Image.asset(
                            OnBoardingModel.onBoardingList[index].imagePath,)),
                    SizedBox(height: 14.h),
                    //dots
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: AppColors.primary,
                          dotHeight: 8,
                          dotWidth: 10,
                          spacing: 8,
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    //title
                    Center(
                      child: Text(
                        OnBoardingModel.onBoardingList[index].title,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    SizedBox(height: 35.h),
                    //subTitle
                    Text(
                      OnBoardingModel.onBoardingList[index].subTitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(height: 90.h),

                    //buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //back button
                        index != 0
                            ? CustomTextButton(
                                text: AppStrings.back,
                                onPressed: () {
                                  controller.previousPage(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                  );
                                },
                              )
                            : Container(),
                        //speacer
                        const Spacer(),
                        //next Button
                        index != 2
                            ? CustomElevatedButton(
                                text: AppStrings.next,
                                onPressed: () {
                                  controller.nextPage(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                  );
                                },
                              )
                            : CustomElevatedButton(
                                text: AppStrings.getStarted,
                                onPressed: () async {
                                  await sl<CacheHelper>()
                                      .saveData(
                                          key: AppStrings.onBoardingKey,
                                          value: true)
                                      .then((value) {
                                    navigate(
                                        context: context,
                                        screen: const HomeScreen());
                                  });
                                  /*.catchError((e){print(e.toString());})*/
                                })
                      ],
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
