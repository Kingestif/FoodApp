import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/Features/Presentation/bloc/food_bloc.dart';

import 'Core/platform/network_info.dart';
import 'Features/Data/data source/Remote_data_source.dart';
import 'Features/Data/repositories/Product_repository_implementation.dart';
import 'Features/Domain/repositories/FoodRepository.dart';
import 'Features/Domain/usecase/getAllProducts.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // External dependencies
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client()); // Register HTTP client

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
    remoteDataSource: sl(),
    networkInfo: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => GetProductAllUsecase(sl()));

  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
        () => ProductRemoteDataSourceImpl(client: sl()),
  );

  // BLoC
  sl.registerFactory(() => FoodBloc(
    getProductAllUsecase: sl(),
  ));




}