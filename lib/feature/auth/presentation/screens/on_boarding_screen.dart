import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/feature/auth/datamodel/model/on_boarding_model.dart';
import 'package:to_do_app/feature/task/presentation/screens/home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({
    super.key,
  });
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                      index != 2 ? TextButton(
                        child: Text(
                          AppStrings.skip,
                          style:Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: AppColors.white.withOpacity(.44),
                            fontSize: 16
                          )
                        ),
                        onPressed: () {
                          controller.jumpToPage(2);
                        },
                      ) : const SizedBox(height: 16,),
                    ],
                  ),
                  index != 2 ? const SizedBox(height: 30) : const SizedBox(height: 60),
                  //image
                  Center(
                      child: Image.asset(OnBoardingModel
                          .onBoardingList[index].imagePath)),
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
                      index != 0 ? TextButton(
                        child: Text(
                          AppStrings.back,
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: AppColors.white.withOpacity(.44),
                            fontSize: 16
                          )
                        ),
                        onPressed: () {
                          controller.previousPage(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        },
                      ) : Container(),
                      //speacer
                      const Spacer(),
                      //next Button
                      index != 2 ? ElevatedButton(
                        style: Theme.of(context).elevatedButtonTheme.style,
                        onPressed: () {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        },
                        child: const Text(
                          AppStrings.next,
                          style: TextStyle(color: AppColors.white),
                        ),
                      ) :  ElevatedButton(
                        style: Theme.of(context).elevatedButtonTheme.style,
                        onPressed: () {
                          Navigator.pushReplacement(context, 
                          MaterialPageRoute(builder: (_) => const HomeScreen()));
                        },  
                        child: const Text(
                          AppStrings.getStarted,
                          style: TextStyle(color: AppColors.white),
                        ),),
                    ],
                  )
                ],
              );
            }),
      ),
    ));
  }
}
