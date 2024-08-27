// features/product/data/datasources/product_remote_data_source.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../Core/error/exception.dart';
import '../model/Product_Model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await client.get(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> productJson = json.decode(response.body)['data'];
      return productJson
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
