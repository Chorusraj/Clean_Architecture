import 'package:clean_architecture_practice/core/error/failure.dart';
import 'package:clean_architecture_practice/core/usecase/usecase.dart';
import 'package:clean_architecture_practice/features/product/domain/entity/products_entity.dart';
import 'package:clean_architecture_practice/features/product/domain/repository/product_repository.dart';
import 'package:dartz/dartz.dart';

class FetchProductUsecase extends UseCase<List<ProductsEntity>,NoParams>{
  final ProductRepository repository;
  FetchProductUsecase(this.repository);

  @override
  Future<Either<Failure, List<ProductsEntity>>> call(NoParams params) async {
   return await repository.fetchProducts();
  }
  
}