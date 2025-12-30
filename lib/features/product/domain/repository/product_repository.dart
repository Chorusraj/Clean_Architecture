import 'package:clean_architecture_practice/core/error/failure.dart';
import 'package:clean_architecture_practice/features/product/domain/entity/products_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure,List<ProductsEntity>>> fetchProducts();
}