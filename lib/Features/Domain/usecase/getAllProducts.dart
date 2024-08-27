import 'package:dartz/dartz.dart';
import 'package:untitled/Features/Domain/entity/Food.dart';
import '../../../../Core/error/failure.dart';
import '../repositories/FoodRepository.dart';

class GetProductAllUsecase {
  final ProductRepository repository;
  GetProductAllUsecase(this.repository);

  Future<Either <Failure, List<Product>>> execute() {
    return repository.getProducts();
  }
}