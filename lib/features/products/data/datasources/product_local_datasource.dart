import 'package:flutter_task_systems_ltd/core/services/cache/cache_service.dart';
import 'package:flutter_task_systems_ltd/core/utils/app_constants.dart';
import 'package:flutter_task_systems_ltd/features/products/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getCachedProducts();

  Future<void> cacheProducts(List<ProductModel> products);

  Future<ProductModel?> getCachedProductById(int id);

  Future<List<int>> getFavoriteIds();

  Future<void> addFavorite(int productId);

  Future<void> removeFavorite(int productId);

  Future<bool> isFavorite(int productId);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final CacheService _cacheService;

  ProductLocalDataSourceImpl(this._cacheService);

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    return await _cacheService.getValues<ProductModel>(
          boxName: AppConstants.productsBoxName,
        ) ??
        [];
  }

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    await _cacheService.clear(boxName: AppConstants.productsBoxName);
    for (var product in products) {
      await _cacheService.put<ProductModel>(
        boxName: AppConstants.productsBoxName,
        key: product.id,
        value: product,
      );
    }
  }

  @override
  Future<ProductModel?> getCachedProductById(int id) async {
    return await _cacheService.get<ProductModel>(
      boxName: AppConstants.productsBoxName,
      key: id,
    );
  }

  @override
  Future<List<int>> getFavoriteIds() async {
    return await _cacheService.getValues<int>(
          boxName: AppConstants.favoritesBoxName,
        ) ??
        [];
  }

  @override
  Future<void> addFavorite(int productId) async {
    await _cacheService.put<int>(
      boxName: AppConstants.favoritesBoxName,
      key: productId,
      value: productId,
    );
  }

  @override
  Future<void> removeFavorite(int productId) async {
    await _cacheService.delete<int>(
      boxName: AppConstants.favoritesBoxName,
      key: productId,
    );
  }

  @override
  Future<bool> isFavorite(int productId) async {
    return await _cacheService.containsKey(
      boxName: AppConstants.favoritesBoxName,
      key: productId,
    );
  }
}
