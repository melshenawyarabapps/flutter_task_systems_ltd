import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_task_systems_ltd/core/enums/api_enums.dart';
import 'package:flutter_task_systems_ltd/core/enums/bloc_enums.dart';
import 'package:flutter_task_systems_ltd/core/errors/app_exceptions.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/entities/product.dart';
import 'package:flutter_task_systems_ltd/features/products/presentation/controllers/products_bloc/products_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks.mocks.dart';

void main() {
  late ProductsBloc bloc;
  late MockGetProducts mockGetProducts;

  setUp(() {
    mockGetProducts = MockGetProducts();
    bloc = ProductsBloc(getProducts: mockGetProducts);
  });

  tearDown(() {
    bloc.close();
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

  group('ProductsBloc', () {
    test('initial state should be correct', () {
      expect(bloc.state.status, equals(RequestStatus.initial));
      expect(bloc.state.products, isEmpty);
      expect(bloc.state.errorMessage, isNull);
    });

    group('GetProducts event', () {
      blocTest<ProductsBloc, ProductsState>(
        'emits [loading, loaded] when getProducts succeeds',
        build: () {
          when(mockGetProducts.call()).thenAnswer((_) async => tProductList);
          return bloc;
        },
        act: (bloc) =>
            bloc.add(const ProductsEvent(type: ProductsEventType.getProducts)),
        expect: () => [
          const ProductsState(status: RequestStatus.loading),
          const ProductsState(
            status: RequestStatus.loaded,
            products: tProductList,
          ),
        ],
        verify: (_) {
          verify(mockGetProducts.call()).called(1);
        },
      );

      blocTest<ProductsBloc, ProductsState>(
        'emits [loading, error] when getProducts throws NoInternetNoCacheException',
        build: () {
          when(
            mockGetProducts.call(),
          ).thenThrow(const NoInternetNoCacheException());
          return bloc;
        },
        act: (bloc) =>
            bloc.add(const ProductsEvent(type: ProductsEventType.getProducts)),
        expect: () => [
          const ProductsState(status: RequestStatus.loading),
          isA<ProductsState>()
              .having((s) => s.status, 'status', RequestStatus.error)
              .having((s) => s.errorMessage, 'errorMessage', isNotEmpty),
        ],
      );
    });

    group('RefreshProducts event', () {
      blocTest<ProductsBloc, ProductsState>(
        'emits [loaded] when refreshProducts succeeds',
        build: () {
          when(mockGetProducts.call()).thenAnswer((_) async => tProductList);
          return bloc;
        },
        act: (bloc) => bloc.add(
          const ProductsEvent(type: ProductsEventType.refreshProducts),
        ),
        expect: () => [
          const ProductsState(
            status: RequestStatus.loaded,
            products: tProductList,
          ),
        ],
      );

      blocTest<ProductsBloc, ProductsState>(
        'emits [error] when refreshProducts fails',
        build: () {
          when(
            mockGetProducts.call(),
          ).thenThrow(const NoInternetNoCacheException());
          return bloc;
        },
        act: (bloc) => bloc.add(
          const ProductsEvent(type: ProductsEventType.refreshProducts),
        ),
        expect: () => [
          isA<ProductsState>().having(
            (s) => s.status,
            'status',
            RequestStatus.error,
          ),
        ],
      );
    });
  });
}
