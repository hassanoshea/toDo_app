import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
<<<<<<< HEAD
import 'package:to_do_app/core/commons/commons';
import 'package:to_do_app/core/database/cache_helper.dart';
import 'package:to_do_app/core/service/service_locator.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
import 'package:to_do_app/core/widgets/custom_text_button.dart';
import 'package:to_do_app/feature/auth/data/on_boarding_model.dart';
import 'package:to_do_app/feature/task/presentation/screens/home_screen.dart';

=======
import 'package:to_do_app/core/commons/commos.dart';
import 'package:to_do_app/core/database/cashe_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widgets/custom_elevated_button.dart';
import 'package:to_do_app/core/widgets/custom_text_button.dart';
import 'package:to_do_app/feature/auth/datamodel/model/on_boarding_model.dart';
import 'package:to_do_app/feature/task/presentation/screens/home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({
    super.key,
  });
  final PageController controller = PageController();
>>>>>>> 47d420bcc8accbe44dc28be324fb65d4ac19cf13

class OnBoaringScreens extends StatelessWidget {
  OnBoaringScreens({super.key});
  PageController controller = PageController();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
<<<<<<< HEAD
          body: Padding(
        padding: const EdgeInsets.all(24),
        child: PageView.builder(
          controller: controller,
          itemCount: OnBoardingModel.onBoardingScreens.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                //skip text
                index != 2
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: CustomTextButton(
                          text: AppStrings.skip,
                          onPressed: () {
                            controller.jumpToPage(2);
                          },
                        ),
                      )
                    : const SizedBox(
                        height: 50,
                      ),
                const SizedBox(
                  height: 16,
                ),
                //image
                Image.asset(OnBoardingModel.onBoardingScreens[index].imgPath),
                const SizedBox(
                  height: 16,
                ),

                //dots
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      // dotColor: AppColors.red
                      dotHeight: 10,
                      spacing: 8
                      // dotWidth: 10
                      ),
                ),
                const SizedBox(
                  height: 52,
                ),

                //title
                Text(
                  OnBoardingModel.onBoardingScreens[index].title,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 42,
                ),

                //subTitle
                Text(
                  OnBoardingModel.onBoardingScreens[index].subTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 90,
                ),
                //buttons
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //back button
                    index != 0
                        ? CustomTextButton(
                            text: AppStrings.back,
                            onPressed: () {
                              controller.previousPage(
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.fastLinearToSlowEaseIn,
                              );
                            },
                          )
                        : Container(),
                    //spacer
                    const Spacer(),
                    //next Button
                    index != 2
                        ? CustomButton(
                            text: AppStrings.next,
                            onPressed: () {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            },
                          )
                        : CustomButton(
                            text: AppStrings.getStarted,
                            onPressed: () async {
                              //navigate to home screen
                              await sl<CacheHelper>()
                                  .saveData(
                                      key: AppStrings.onBoardingKey,
                                      value: true)
                                  .then((value) {
                                navigate(
                                    context: context,
                                    screen:  const HomeScreen());
                              }).catchError((e) {
                                print(e.toString());
                              });
                            })
                  ],
                )
              ],
            );
          },
        ),
      )),
=======
        body: Padding(
          padding: const EdgeInsets.all(24),
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
                            : const SizedBox(
                                height: 16,
                              ),
                      ],
                    ),
                    index != 2
                        ? const SizedBox(height: 30)
                        : const SizedBox(height: 60),
                    //image
                    Center(
                        child: Image.asset(
                            OnBoardingModel.onBoardingList[index].imagePath)),
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 52),
                    //title
                    Center(
                      child: Text(
                        OnBoardingModel.onBoardingList[index].title,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    const SizedBox(height: 42),
                    //subTitle
                    Text(
                      OnBoardingModel.onBoardingList[index].subTitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 90),

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
                                    navigator(
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
>>>>>>> 47d420bcc8accbe44dc28be324fb65d4ac19cf13
    );
  }
}
