import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:working_with_http/models/category/categoryY_model.dart';

class CategoryYHttpServices {
  Future<List<CategoryY>> fetchCategories() async {
    Uri query = Uri.parse('https://api.escuelajs.co/api/v1/categories');
    final response = await http.get(query);
    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> data =
          (jsonDecode(response.body)).cast<Map<String, dynamic>>();
      List<CategoryY> categories = [];
      print(response.body);
      print('1');
      for (int i = 0; i < data.length; i++) {
        categories.add(
          CategoryY.fromJson(data[i]),
        );
      }
      return categories;
    } else {
      throw Exception('error: CategoryHttpServices().fetchCategories');
    }
  }
}
