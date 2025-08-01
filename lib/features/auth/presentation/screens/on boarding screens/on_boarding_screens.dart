import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:up_to_do/core/services/services_locator.dart';
import 'package:up_to_do/core/utils/app_colors.dart';
import 'package:up_to_do/core/utils/app_strings.dart';
import 'package:up_to_do/core/widget/custom_button.dart';
import 'package:up_to_do/core/widget/custom_text_button.dart';
import 'package:up_to_do/features/auth/data/model/on_bordingModel.dart';
import 'package:up_to_do/features/task/presentation/screens/home/home_screen.dart';
import '../../../../../core/database/cache/cache_helper.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => OoBboardinSscreensState();
}

class OoBboardinSscreensState extends State<OnBoardingScreens> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: PageView.builder(
            controller: controller,
            itemCount: OnBoardingModel.onBoardingScreens.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // skip
                  Align(
                    alignment: Alignment.topLeft,
                    child: index != 2
                        ? CustomTextButton(
                            text: AppStrings.skip,
                            onPressed: () {
                              controller.jumpToPage(2);
                            },
                          )
                        : Container(height: 50.h),
                  ),
                  Gap(15.h),
                  // image
                  Image.asset(OnBoardingModel.onBoardingScreens[index].imgPath),
                  Gap(15.h),
                  SmoothPageIndicator(
                    controller: controller, // PageController
                    count: 3,
                    effect: SlideEffect(
                      spacing: 8.0,
                      radius: 5.0,
                      dotWidth: 26.0,
                      dotHeight: 4.0,
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 1.5,
                      dotColor: AppColors.grey,
                      activeDotColor: AppColors.white,
                    ), // your preferred effect
                    onDotClicked: (index) {},
                  ),
                  Gap(84.h),

                  // title
                  Text(
                    OnBoardingModel.onBoardingScreens[index].title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Gap(40.h),
                  // suptitle
                  Text(
                    textAlign: TextAlign.center,
                    OnBoardingModel.onBoardingScreens[index].subTitle,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      index != 0
                          ? CustomTextButton(
                              text: AppStrings.back,
                              onPressed: () {
                                controller.previousPage(
                                  duration: Duration(milliseconds: 1000),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              },
                            )
                          : Container(),
                      Spacer(),
                      index != 2
                          ? customButton(
                              text: AppStrings.next,
                              onPressed: () {
                                controller.nextPage(
                                  duration: Duration(milliseconds: 1000),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              },
                            )
                          : customButton(
                              text: AppStrings.getStarted,
                              onPressed: () async {
                                await sl<CacheHelper>()
                                    .saveData(
                                      key: AppStrings.onBoardingKey,
                                      value: true,
                                    )
                                    .then((value) {
                                      print("is visited");
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeScreen(),
                                        ),
                                      );
                                    })
                                    .catchError((e) {
                                      print(e);
                                    });
                              },
                            ),
                    ],
                  ),
                  // putton
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
