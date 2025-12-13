import 'package:flutter_task_systems_ltd/core/services/api/api_errors.dart';
import 'package:flutter_task_systems_ltd/core/services/api/api_service.dart';
import 'package:flutter_task_systems_ltd/core/utils/end_points.dart';
import 'package:flutter_task_systems_ltd/features/products/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();

  Future<ProductModel> getProductById(int id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiService _apiService;

  ProductRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await _apiService.get(endPoint: EndPoints.products);

      final List<dynamic> data = response;
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    try {
      final response = await _apiService.get(
        endPoint: '${EndPoints.products}/$id',
      );

      return ProductModel.fromJson(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Failure _handleError(error) {
    return ServerFailure.generalException(error);
  }
}
