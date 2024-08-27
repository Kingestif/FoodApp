// features/product/domain/repositories/product_repository.dart

import 'package:dartz/dartz.dart';

import '../../../Core/error/failure.dart';
import '../entity/Food.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}