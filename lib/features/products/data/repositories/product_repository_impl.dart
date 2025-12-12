import 'package:flutter_task_systems_ltd/core/errors/app_exceptions.dart';
import 'package:flutter_task_systems_ltd/core/services/api/network_info.dart';

import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_datasource.dart';
import '../datasources/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<Product>> getProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getProducts();
        await localDataSource.cacheProducts(remoteProducts);
        return remoteProducts.map((model) => model.toEntity()).toList();
      } catch (e) {
        return _getProductsFromCache();
      }
    } else {
      return _getProductsFromCache();
    }
  }

  Future<List<Product>> _getProductsFromCache() async {
    final cachedProducts = await localDataSource.getCachedProducts();
    if (cachedProducts.isNotEmpty) {
      return cachedProducts.map((model) => model.toEntity()).toList();
    }
    throw const NoInternetNoCacheException();
  }

  @override
  Future<Product> getProductById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProduct = await remoteDataSource.getProductById(id);
        return remoteProduct.toEntity();
      } catch (e) {
        return _getProductFromCache(id);
      }
    } else {
      return _getProductFromCache(id);
    }
  }

  Future<Product> _getProductFromCache(int id) async {
    final cachedProduct = await localDataSource.getCachedProductById(id);
    if (cachedProduct != null) {
      return cachedProduct.toEntity();
    }
    throw const ProductNotInCacheException();
  }

  @override
  Future<List<Product>> getFavoriteProducts() async {
    final favoriteIds = await localDataSource.getFavoriteIds();
    final List<Product> favoriteProducts = [];

    for (final id in favoriteIds) {
      try {
        final product = await localDataSource.getCachedProductById(id);
        if (product != null) {
          favoriteProducts.add(product.toEntity());
        }
      } catch (_) {}
    }

    return favoriteProducts;
  }

  @override
  Future<void> toggleFavorite(int productId) async {
    final isFav = await localDataSource.isFavorite(productId);
    if (isFav) {
      await localDataSource.removeFavorite(productId);
    } else {
      await localDataSource.addFavorite(productId);
    }
  }

  @override
  Future<bool> isFavorite(int productId) async {
    return await localDataSource.isFavorite(productId);
  }
}
