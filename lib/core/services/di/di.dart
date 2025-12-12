import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_task_systems_ltd/core/services/api/api_service.dart';
import 'package:flutter_task_systems_ltd/core/services/cache/cache_service.dart';
import 'package:flutter_task_systems_ltd/core/services/connectivity/connectivity_bloc.dart';
import 'package:flutter_task_systems_ltd/core/services/api/network_info.dart';
import 'package:flutter_task_systems_ltd/features/products/data/datasources/product_local_datasource.dart';
import 'package:flutter_task_systems_ltd/features/products/data/datasources/product_remote_datasource.dart';
import 'package:flutter_task_systems_ltd/features/products/data/repositories/product_repository_impl.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/repositories/product_repository.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/usecases/get_product_by_id.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/usecases/get_products.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/usecases/is_favorite.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/usecases/toggle_favorite.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/controllers/favorite_bloc/favorite_bloc.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/controllers/product_details_bloc/product_details_bloc.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/controllers/products_bloc/products_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

setUp() {
  getIt.registerLazySingleton(() => CacheService());
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => Connectivity());
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<Connectivity>()),
  );

  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(getIt<CacheService>()),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: getIt<ProductRemoteDataSource>(),
      localDataSource: getIt<ProductLocalDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );

  getIt.registerLazySingleton(() => GetProducts(getIt<ProductRepository>()));
  getIt.registerLazySingleton(() => GetProductById(getIt<ProductRepository>()));
  getIt.registerLazySingleton(() => ToggleFavorite(getIt<ProductRepository>()));
  getIt.registerLazySingleton(() => IsFavorite(getIt<ProductRepository>()));

  getIt.registerFactory(() => ProductsBloc(getProducts: getIt<GetProducts>()));
  getIt.registerFactory(
    () => ProductDetailsBloc(getProductById: getIt<GetProductById>()),
  );
  getIt.registerFactory(
    () => FavoriteBloc(
      toggleFavorite: getIt<ToggleFavorite>(),
      isFavorite: getIt<IsFavorite>(),
    ),
  );
  getIt.registerLazySingleton(
    () => ConnectivityBloc(connectivity: getIt<Connectivity>()),
  );
}
