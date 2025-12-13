import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_task_systems_ltd/features/products/data/models/product_model.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/entities/product.dart';

void main() {
  group('ProductModel', () {
    const tProductJson = {
      'id': 1,
      'title': 'Test Product',
      'price': 99.99,
      'description': 'Test Description',
      'category': 'test',
      'image': 'https://example.com/image.png',
      'rating': {'rate': 4.5, 'count': 100},
    };

    final tProductModel = ProductModel(
      id: 1,
      title: 'Test Product',
      price: 99.99,
      description: 'Test Description',
      category: 'test',
      image: 'https://example.com/image.png',
      rating: 4.5,
      ratingCount: 100,
    );

    const tProduct = Product(
      id: 1,
      title: 'Test Product',
      price: 99.99,
      description: 'Test Description',
      category: 'test',
      image: 'https://example.com/image.png',
      rating: 4.5,
      ratingCount: 100,
    );

    group('fromJson', () {
      test('should return a valid model from JSON', () {
        final result = ProductModel.fromJson(tProductJson);

        expect(result.id, tProductModel.id);
        expect(result.title, tProductModel.title);
        expect(result.price, tProductModel.price);
        expect(result.description, tProductModel.description);
        expect(result.category, tProductModel.category);
        expect(result.image, tProductModel.image);
        expect(result.rating, tProductModel.rating);
        expect(result.ratingCount, tProductModel.ratingCount);
      });

      test('should handle null rating data', () {
        final jsonWithNullRating = Map<String, dynamic>.from(tProductJson);
        jsonWithNullRating['rating'] = null;

        final result = ProductModel.fromJson(jsonWithNullRating);

        expect(result.rating, 0.0);
        expect(result.ratingCount, 0);
      });

      test('should handle missing rating fields', () {
        final jsonWithEmptyRating = Map<String, dynamic>.from(tProductJson);
        jsonWithEmptyRating['rating'] = {};

        final result = ProductModel.fromJson(jsonWithEmptyRating);

        expect(result.rating, 0.0);
        expect(result.ratingCount, 0);
      });
    });

    group('toJson', () {
      test('should return a JSON map containing proper data', () {
        final result = tProductModel.toJson();

        expect(result['id'], 1);
        expect(result['title'], 'Test Product');
        expect(result['price'], 99.99);
        expect(result['description'], 'Test Description');
        expect(result['category'], 'test');
        expect(result['image'], 'https://example.com/image.png');
        expect(result['rating']['rate'], 4.5);
        expect(result['rating']['count'], 100);
      });
    });

    group('toEntity', () {
      test('should return a Product entity', () {
        final result = tProductModel.toEntity();

        expect(result, equals(tProduct));
      });
    });

    group('fromEntity', () {
      test('should return a ProductModel from entity', () {
        final result = ProductModel.fromEntity(tProduct);

        expect(result.id, tProduct.id);
        expect(result.title, tProduct.title);
        expect(result.price, tProduct.price);
        expect(result.description, tProduct.description);
        expect(result.category, tProduct.category);
        expect(result.image, tProduct.image);
        expect(result.rating, tProduct.rating);
        expect(result.ratingCount, tProduct.ratingCount);
      });
    });
  });
}
