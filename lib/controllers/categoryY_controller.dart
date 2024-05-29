import 'package:working_with_http/models/category/categoryY_model.dart';
import 'package:working_with_http/services/category_http_services.dart';

class CategoryYController {
  final CategoryYHttpServices _categoryYHttpServices = CategoryYHttpServices();

  Future<List<CategoryY>> getCategories() async {
    List<CategoryY> categories = await _categoryYHttpServices.fetchCategories();
    return categories;
  }
}
