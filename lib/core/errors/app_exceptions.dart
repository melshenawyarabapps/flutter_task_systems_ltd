import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_task_systems_ltd/core/services/logger/app_logger.dart';
import 'package:flutter_task_systems_ltd/core/translations/locale_keys.g.dart';

abstract class AppException implements Exception {
  final String localeKey;
  final String? fallbackMessage;
  final int? statusCode;

  const AppException({
    required this.localeKey,
    this.fallbackMessage,
    this.statusCode,
  });

  @override
  String toString() => fallbackMessage ?? localeKey;
}

class ServerException extends AppException {
  const ServerException({
    required super.localeKey,
    super.fallbackMessage,
    super.statusCode,
  });

  factory ServerException.fromException(dynamic exception) {
    try {
      if (exception is DioException) {
        return ServerException._fromDioException(exception);
      }
    } catch (e) {
      return ServerException(
        localeKey: LocaleKeys.oppsAnUnexpectedErrorOccurredPleaseTryAgainLater,
        fallbackMessage: LocaleKeys
            .oppsAnUnexpectedErrorOccurredPleaseTryAgainLater
            .tr(),
      );
    }
    return ServerException(
      localeKey: LocaleKeys.oppsAnUnexpectedErrorOccurredPleaseTryAgainLater,
      fallbackMessage: exception.toString(),
    );
  }

  factory ServerException._fromDioException(DioException exception) {
    AppLogger.instance.error(
      exception.response?.data?.toString() ?? 'No response data',
    );

    switch (exception.type) {
      case DioExceptionType.sendTimeout:
        return ServerException(
          localeKey: LocaleKeys.sendTimeOutPleaseTryAgainLater,
          fallbackMessage: LocaleKeys.sendTimeOutPleaseTryAgainLater.tr(),
          statusCode: exception.response?.statusCode,
        );
      case DioExceptionType.receiveTimeout:
        return ServerException(
          localeKey: LocaleKeys.receiveTimeOutPleaseTryAgainLater,
          fallbackMessage: LocaleKeys.receiveTimeOutPleaseTryAgainLater.tr(),
          statusCode: exception.response?.statusCode,
        );
      case DioExceptionType.connectionError:
        return ServerException(
          localeKey: LocaleKeys.connectionErrorPleaseTryAgainLater,
          fallbackMessage: LocaleKeys.connectionErrorPleaseTryAgainLater.tr(),
          statusCode: exception.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return ServerException(
          localeKey: LocaleKeys.requestHasBeenCancelledPleaseTryAgainLater,
          fallbackMessage: LocaleKeys.requestHasBeenCancelledPleaseTryAgainLater
              .tr(),
          statusCode: exception.response?.statusCode,
        );
      case DioExceptionType.badResponse:
        final message = exception.response?.data?['message'];
        if (message != null) {
          return ServerException(
            localeKey:
                LocaleKeys.oppsAnUnexpectedErrorOccurredPleaseTryAgainLater,
            fallbackMessage: message.toString(),
            statusCode: exception.response?.statusCode,
          );
        }
        return ServerException(
          localeKey:
              LocaleKeys.oppsAnUnexpectedErrorOccurredPleaseTryAgainLater,
          fallbackMessage: LocaleKeys
              .oppsAnUnexpectedErrorOccurredPleaseTryAgainLater
              .tr(),
          statusCode: exception.response?.statusCode,
        );
      default:
        return ServerException(
          localeKey:
              LocaleKeys.oppsAnUnexpectedErrorOccurredPleaseTryAgainLater,
          fallbackMessage: LocaleKeys
              .oppsAnUnexpectedErrorOccurredPleaseTryAgainLater
              .tr(),
          statusCode: exception.response?.statusCode,
        );
    }
  }
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
