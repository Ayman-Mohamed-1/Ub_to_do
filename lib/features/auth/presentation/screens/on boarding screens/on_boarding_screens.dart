import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:up_to_do/core/utils/app_colors.dart';
import 'package:up_to_do/core/utils/app_strings.dart';
import 'package:up_to_do/core/widget/custom_button.dart';
import 'package:up_to_do/core/widget/custom_text_button.dart';
import 'package:up_to_do/features/auth/data/model/on_bordingModel.dart';
import 'package:up_to_do/features/task/task.dart';

class OnBoardingScreens extends StatefulWidget {
  OnBoardingScreens({super.key});

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
          padding: const EdgeInsets.all(24.0),
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
                        : Container(height: 50),
                  ),
                  Gap(15),
                  // image
                  Image.asset(OnBoardingModel.onBoardingScreens[index].imgPath),
                  Gap(15),
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
                  Gap(84),

                  // title
                  Text(
                    OnBoardingModel.onBoardingScreens[index].title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Gap(40),
                  // suptitle
                  Text(
                    textAlign: TextAlign.center,
                    OnBoardingModel.onBoardingScreens[index].subTitle,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.white.withOpacity(.8),
                    ),
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
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Task(),
                                  ),
                                );
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
