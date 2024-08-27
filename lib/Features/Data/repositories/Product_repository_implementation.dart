// features/product/data/repositories/product_repository_impl.dart

import 'package:dartz/dartz.dart';

import '../../../Core/error/failure.dart';
import '../../../Core/platform/network_info.dart';
import '../../Domain/entity/Food.dart';
import '../../Domain/repositories/FoodRepository.dart';
import '../data source/Remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getProducts();
        return Right(remoteProducts);
      } catch (e) {
        return Left(ServerFailure('Failed to get all products'));
      }
    } else {
      return Left(ConnectionFailure('no Internet connection'));
    }
  }
}
