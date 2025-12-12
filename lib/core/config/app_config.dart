import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_task_systems_ltd/core/services/cache/cache_service.dart';
import 'package:flutter_task_systems_ltd/core/services/di/di.dart';
import 'package:flutter_task_systems_ltd/core/services/observers/bloc_lifecycle_observer.dart';

class AppConfig {
  static AppConfig? _instance;

  static AppConfig get instance => _instance ??= AppConfig._();

  AppConfig._();

  Future<void> initApp() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    setUp();
    Bloc.observer = BlocLifecycleObserver.instance;
    await Future.wait([getIt.get<CacheService>().init()]);
    FlutterNativeSplash.remove();
  }
}
