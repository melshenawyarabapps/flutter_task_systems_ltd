import 'package:flutter_task_systems_ltd/core/services/api/api_service.dart';
import 'package:flutter_task_systems_ltd/core/services/cache/cache_service.dart';
import 'package:get_it/get_it.dart';


GetIt getIt = GetIt.instance;

setUp() {
  getIt.registerLazySingleton(() => CacheService());
  getIt.registerLazySingleton(() => ApiService());
}
