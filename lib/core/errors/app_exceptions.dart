import 'package:flutter_task_systems_ltd/core/translations/locale_keys.g.dart';

abstract class AppException implements Exception {
  final String localeKey;
  final String? fallbackMessage;

  const AppException({required this.localeKey, this.fallbackMessage});

  @override
  String toString() => fallbackMessage ?? localeKey;
}

class NoInternetException extends AppException {
  const NoInternetException()
    : super(
        localeKey: LocaleKeys.noInternetConnection,
        fallbackMessage: 'No internet connection',
      );
}

class NoInternetNoCacheException extends AppException {
  const NoInternetNoCacheException()
    : super(
        localeKey: LocaleKeys.noInternetNoCachedData,
        fallbackMessage: 'No internet connection and no cached data available',
      );
}

class ProductNotInCacheException extends AppException {
  const ProductNotInCacheException()
    : super(
        localeKey: LocaleKeys.productNotInCache,
        fallbackMessage:
            'No internet connection and product not found in cache',
      );
}

class FailedToLoadProductsException extends AppException {
  const FailedToLoadProductsException()
    : super(
        localeKey: LocaleKeys.errorLoadingProducts,
        fallbackMessage: 'Failed to load products',
      );
}

class FailedToLoadProductException extends AppException {
  const FailedToLoadProductException()
    : super(
        localeKey: LocaleKeys.errorLoadingProductDetails,
        fallbackMessage: 'Failed to load product details',
      );
}
