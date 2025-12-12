import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_datasource.dart';
import '../datasources/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Product>> getProducts() async {
    try {
      final remoteProducts = await remoteDataSource.getProducts();
      await localDataSource.cacheProducts(remoteProducts);

      return remoteProducts.map((model) => model.toEntity()).toList();
    } catch (e) {
      try {
        final cachedProducts = await localDataSource.getCachedProducts();
        if (cachedProducts.isNotEmpty) {
          return cachedProducts.map((model) => model.toEntity()).toList();
        }
      } catch (_) {}

      rethrow;
    }
  }

  @override
  Future<Product> getProductById(int id) async {
    try {
      final remoteProduct = await remoteDataSource.getProductById(id);
      return remoteProduct.toEntity();
    } catch (e) {
      final cachedProduct = await localDataSource.getCachedProductById(id);
      if (cachedProduct != null) {
        return cachedProduct.toEntity();
      }
      rethrow;
    }
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
