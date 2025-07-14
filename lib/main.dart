import 'package:flutter/material.dart';
import 'package:up_to_do/App/app.dart';
import 'package:up_to_do/core/database/cache/cache_helper.dart';
import 'package:up_to_do/core/services/services_locator.dart';
import 'package:up_to_do/core/utils/app_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await sl<CacheHelper>().init();

  // await sl<CacheHelper>().removeData(key: AppStrings.onBoardingKey);

  runApp(const MyApp());
}
