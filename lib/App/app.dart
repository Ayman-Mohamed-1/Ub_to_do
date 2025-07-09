import 'package:flutter/material.dart';
import 'package:up_to_do/features/auth/presentation/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To-Do app",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
