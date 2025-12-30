import 'package:clean_architecture_practice/core/error/failure.dart';
import 'package:clean_architecture_practice/core/network/network_info.dart';
import 'package:clean_architecture_practice/features/product/data/datasources/product_datasource.dart';
import 'package:clean_architecture_practice/features/product/domain/entity/products_entity.dart';
import 'package:clean_architecture_practice/features/product/domain/repository/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource datasource;
  final NetworkInfo networkInfo;
  ProductRepositoryImpl(this.datasource, this.networkInfo);

  @override
  Future<Either<Failure, List<ProductsEntity>>> fetchProducts() async {
    bool isConnected = await networkInfo.isConnected;
    if (!isConnected) return Left(NetworkFailure("No Internet connection"));
    try {
      final response = await datasource.getProducts();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure("$e"));
    }
  }
}
