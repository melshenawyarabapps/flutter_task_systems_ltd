import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_task_systems_ltd/core/errors/app_exceptions.dart';
import 'package:flutter_task_systems_ltd/features/products/data/models/product_model.dart';
import 'package:flutter_task_systems_ltd/features/products/data/repositories/product_repository_impl.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/entities/product.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks.mocks.dart';

void main() {
  late ProductRepositoryImpl repository;
  late MockProductRemoteDataSource mockRemoteDataSource;
  late MockProductLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockProductRemoteDataSource();
    mockLocalDataSource = MockProductLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

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

  final tProductModelList = [tProductModel];

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

  final tProductList = [tProduct];

  group('getProducts', () {
    test('should check if the device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        mockRemoteDataSource.getProducts(),
      ).thenAnswer((_) async => tProductModelList);
      when(mockLocalDataSource.cacheProducts(any)).thenAnswer((_) async {});

      await repository.getProducts();

      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return remote data when call is successful', () async {
        when(
          mockRemoteDataSource.getProducts(),
        ).thenAnswer((_) async => tProductModelList);
        when(mockLocalDataSource.cacheProducts(any)).thenAnswer((_) async {});

        final result = await repository.getProducts();

        verify(mockRemoteDataSource.getProducts());
        expect(result, equals(tProductList));
      });

      test('should cache products when call is successful', () async {
        when(
          mockRemoteDataSource.getProducts(),
        ).thenAnswer((_) async => tProductModelList);
        when(mockLocalDataSource.cacheProducts(any)).thenAnswer((_) async {});

        await repository.getProducts();

        verify(mockLocalDataSource.cacheProducts(tProductModelList));
      });

      test('should return cached data when remote call fails', () async {
        when(mockRemoteDataSource.getProducts()).thenThrow(Exception());
        when(
          mockLocalDataSource.getCachedProducts(),
        ).thenAnswer((_) async => tProductModelList);

        final result = await repository.getProducts();

        verify(mockLocalDataSource.getCachedProducts());
        expect(result, equals(tProductList));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return cached data when available', () async {
        when(
          mockLocalDataSource.getCachedProducts(),
        ).thenAnswer((_) async => tProductModelList);

        final result = await repository.getProducts();

        verify(mockLocalDataSource.getCachedProducts());
        expect(result, equals(tProductList));
      });

      test(
        'should throw NoInternetNoCacheException when cache is empty',
        () async {
          when(
            mockLocalDataSource.getCachedProducts(),
          ).thenAnswer((_) async => []);

          expect(
            () => repository.getProducts(),
            throwsA(isA<NoInternetNoCacheException>()),
          );
        },
      );
    });
  });

  group('getProductById', () {
    const tProductId = 1;

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return product from remote when successful', () async {
        when(
          mockRemoteDataSource.getProductById(tProductId),
        ).thenAnswer((_) async => tProductModel);

        final result = await repository.getProductById(tProductId);

        expect(result, equals(tProduct));
      });

      test('should return cached product when remote fails', () async {
        when(
          mockRemoteDataSource.getProductById(tProductId),
        ).thenThrow(Exception());
        when(
          mockLocalDataSource.getCachedProductById(tProductId),
        ).thenAnswer((_) async => tProductModel);

        final result = await repository.getProductById(tProductId);

        expect(result, equals(tProduct));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return cached product when available', () async {
        when(
          mockLocalDataSource.getCachedProductById(tProductId),
        ).thenAnswer((_) async => tProductModel);

        final result = await repository.getProductById(tProductId);

        expect(result, equals(tProduct));
      });

      test(
        'should throw ProductNotInCacheException when not in cache',
        () async {
          when(
            mockLocalDataSource.getCachedProductById(tProductId),
          ).thenAnswer((_) async => null);

          expect(
            () => repository.getProductById(tProductId),
            throwsA(isA<ProductNotInCacheException>()),
          );
        },
      );
    });
  });

  group('toggleFavorite', () {
    const tProductId = 1;

    test('should add to favorites when not favorite', () async {
      when(
        mockLocalDataSource.isFavorite(tProductId),
      ).thenAnswer((_) async => false);
      when(
        mockLocalDataSource.addFavorite(tProductId),
      ).thenAnswer((_) async {});

      await repository.toggleFavorite(tProductId);

      verify(mockLocalDataSource.addFavorite(tProductId));
    });

    test('should remove from favorites when favorite', () async {
      when(
        mockLocalDataSource.isFavorite(tProductId),
      ).thenAnswer((_) async => true);
      when(
        mockLocalDataSource.removeFavorite(tProductId),
      ).thenAnswer((_) async {});

      await repository.toggleFavorite(tProductId);

      verify(mockLocalDataSource.removeFavorite(tProductId));
    });
  });

  group('isFavorite', () {
    const tProductId = 1;

    test('should return true when product is favorite', () async {
      when(
        mockLocalDataSource.isFavorite(tProductId),
      ).thenAnswer((_) async => true);

      final result = await repository.isFavorite(tProductId);

      expect(result, true);
    });

    test('should return false when product is not favorite', () async {
      when(
        mockLocalDataSource.isFavorite(tProductId),
      ).thenAnswer((_) async => false);

      final result = await repository.isFavorite(tProductId);

      expect(result, false);
    });
  });
}
