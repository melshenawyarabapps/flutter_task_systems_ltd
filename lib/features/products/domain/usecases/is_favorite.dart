import '../repositories/product_repository.dart';

class IsFavorite {
  final ProductRepository repository;

  IsFavorite(this.repository);

  Future<bool> call(int productId) async {
    return await repository.isFavorite(productId);
  }
}
