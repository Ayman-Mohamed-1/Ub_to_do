import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:up_to_do/core/database/cache/cache_helper.dart';
import 'package:up_to_do/core/services/services_locator.dart';
import 'package:up_to_do/core/utils/app_assets.dart';
import 'package:up_to_do/core/utils/app_colors.dart';
import 'package:up_to_do/core/utils/app_strings.dart';
import 'package:up_to_do/features/auth/presentation/screens/on%20boarding%20screens/on_boarding_screens.dart';
import 'package:up_to_do/features/task/task.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    navegat();
    super.initState();
  }

  void navegat() async {
    bool isVisted =
        await sl<CacheHelper>().getData(key: AppStrings.onBoardingKey) ?? false;
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => isVisted ? Task() : OnBoardingScreens(),
          ),
        );
      },

      // => isVisted == true
      //     ? Navigator.push(context, MaterialPageRoute(builder: (c) => Task()))
      //     : Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (_) => OnBoardingScreens()),
      //       ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logo),
            Gap(15),
            Text(
              AppStrings.appName,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 40,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
