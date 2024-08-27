// features/product/data/models/product_model.dart

import '../../Domain/entity/Food.dart';

class ProductModel extends Product {
  ProductModel({
    required String id,
    required String title,
    required String imageUrl,
    required double rating,
    required double price,
    required double discount,
    required String description,
    required List<ProductOptionModel> options,
  }) : super(
    id: id,
    title: title,
    imageUrl: imageUrl,
    rating: rating,
    price: price,
    discount: discount,
    description: description,
    options: options,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      rating: (json['rating'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      description: json['description'],
      options: (json['options'] as List)
          .map((option) => ProductOptionModel.fromJson(option))
          .toList(),
    );
  }
}

class ProductOptionModel extends ProductOption {
  ProductOptionModel({
    required String id,
    required String name,
    required double price,
  }) : super(id: id, name: name, price: price);

  factory ProductOptionModel.fromJson(Map<String, dynamic> json) {
    return ProductOptionModel(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
    );
  }
}
