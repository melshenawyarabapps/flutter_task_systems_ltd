import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductById(int id);
  Future<List<Product>> getFavoriteProducts();
  Future<void> toggleFavorite(int productId);
  Future<bool> isFavorite(int productId);
}
