import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_to_do/core/theme/theme.dart';
import 'package:up_to_do/features/auth/presentation/screens/splash%20Screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: DarkTheme(),
          themeMode: ThemeMode.dark,
          // فى مشكله فى  dark mode
          // darkTheme: getAppTheme(),
          title: "To-Do app",
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: SplashScreen(),
    );
  }
}
