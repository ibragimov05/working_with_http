import 'product_category_model.dart';

class Product {
  final int productId;

  final String productTitle;
  final int productPrice;
  final String productDescription;
  final List<String> productImages;
  final String productCreationAt;
  final String productUpdatedAt;
  final ProductCategory productCategory;

  Product({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productDescription,
    required this.productImages,
    required this.productCreationAt,
    required this.productUpdatedAt,
    required this.productCategory,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['id'] as int,
      productTitle: json['title'] as String,
      productPrice: json['price'] as int,
      productDescription: json['description'] as String,
      productImages: List<String>.from(json['images'] as List<dynamic>),
      productCreationAt: json['creationAt'] as String,
      productUpdatedAt: json['updatedAt'] as String,
      productCategory: ProductCategory.fromJson(json['category'] as Map<String, dynamic>),
    );
  }
}
