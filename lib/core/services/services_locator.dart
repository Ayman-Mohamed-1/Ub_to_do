import 'package:get_it/get_it.dart';
import 'package:up_to_do/core/database/cache/cache_helper.dart';

final sl = GetIt.instance;
Future<void> setup() async {
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
}

// ! use
