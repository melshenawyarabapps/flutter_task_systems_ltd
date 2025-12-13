import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/entities/product.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks.mocks.dart';

void main() {
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
  });

  const tProductList = [
    Product(
      id: 1,
      title: 'Test Product',
      price: 99.99,
      description: 'Test Description',
      category: 'test',
      image: 'https://example.com/image.png',
      rating: 4.5,
      ratingCount: 100,
    ),
  ];

  group('GetProducts', () {
    test('should get products from repository', () async {
      when(mockRepository.getProducts()).thenAnswer((_) async => tProductList);

      final result = await mockRepository.getProducts();

      expect(result, equals(tProductList));
      verify(mockRepository.getProducts());
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
