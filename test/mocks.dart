import 'package:flutter_task_systems_ltd/core/services/api/network_info.dart';
import 'package:flutter_task_systems_ltd/features/products/data/datasources/product_local_datasource.dart';
import 'package:flutter_task_systems_ltd/features/products/data/datasources/product_remote_datasource.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/repositories/product_repository.dart';
import 'package:flutter_task_systems_ltd/features/products/domain/usecases/get_products.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  ProductRemoteDataSource,
  ProductLocalDataSource,
  ProductRepository,
  NetworkInfo,
  GetProducts,
])
void main() {}
