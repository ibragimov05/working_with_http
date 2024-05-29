import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:working_with_http/models/product/product_model.dart';

class ProductHttpServices {
  Future<List<Product>> fetchProducts() async {
    Uri query = Uri.parse('https://api.escuelajs.co/api/v1/products');
    final response = await http.get(query);
    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> data =
          (jsonDecode(response.body)).cast<Map<String, dynamic>>();
      List<Product> products = [];
      for (int i = 0; i < data.length; i++) {
        products.add(Product.fromJson(data[i]));
      }
      return products;
    } else {
      throw Exception('error: ProductHttpServices().fetchProducts');
    }
  }
}
