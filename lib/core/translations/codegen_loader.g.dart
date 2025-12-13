// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;
import 'package:flutter_task_systems_ltd/core/translations/locale_keys.g.dart';

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ar = {
    "networkError": "الرجاء التحقق من اتصالك بالشبكة ومحاولة مرة أخرى",
    "unexpectedError": "خطأ غير متوقع",
    "sendTimeOutPleaseTryAgainLater": "يرجى إعادة المحاولة لاحقًا.",
    "receiveTimeOutPleaseTryAgainLater": "يرجى المحاولة مرة أخرى فى وقت لاحق.",
    "connectionErrorPleaseTryAgainLater":
        "خطأ فى الاتصال، يرجى المحاولة مرة أخرى لاحقًا.",
    "requestHasBeenCancelledPleaseTryAgainLater":
        "تم إلغاء الطلب، يرجى المحاولة مرة أخرى لاحقًا.",
    "oppsAnUnexpectedErrorOccurredPleaseTryAgainLater":
        "عفوًا، حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى لاحقًا",
    "products": "المنتجات",
    "productDetails": "تفاصيل المنتج",
    "reviews": "التقييمات",
    "description": "الوصف",
    "errorLoadingProducts": "خطأ في تحميل المنتجات",
    "retry": "إعادة المحاولة",
    "noProducts": "لا توجد منتجات متاحة",
    "noInternetConnection": "لا يوجد اتصال بالإنترنت",
    "noInternetNoCachedData": "لا يوجد اتصال بالإنترنت ولا توجد بيانات مخزنة",
    "productNotInCache":
        "لا يوجد اتصال بالإنترنت والمنتج غير موجود في التخزين المؤقت",
    "errorLoadingProductDetails": "خطأ في تحميل تفاصيل المنتج",
    "online": "متصل",
    "offline": "غير متصل",
  };

  static const Map<String, dynamic> en = {
    "networkError": "Network error occurred",
    "unexpectedError": "An unexpected error occurred",
    "sendTimeOutPleaseTryAgainLater": "Send timeout. Please try again later",
    "receiveTimeOutPleaseTryAgainLater":
        "Receive timeout. Please try again later",
    "connectionErrorPleaseTryAgainLater":
        "Connection error. Please try again later",
    "requestHasBeenCancelledPleaseTryAgainLater":
        "Request cancelled. Please try again later",
    "oppsAnUnexpectedErrorOccurredPleaseTryAgainLater":
        "Oops! An unexpected error occurred. Please try again later",
    "products": "Products",
    "productDetails": "Product Details",
    "reviews": "Reviews",
    "description": "Description",
    "errorLoadingProducts": "Error loading products",
    "retry": "Retry",
    "noProducts": "No products available",
    "noInternetConnection": "No internet connection",
    "noInternetNoCachedData":
        "No internet connection and no cached data available",
    "productNotInCache":
        "No internet connection and product not found in cache",
    "errorLoadingProductDetails": "Error loading product details",
    "online": "Online",
    "offline": "Offline",
  };

  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": ar,
    "en": en,
  };
}
