import 'package:working_with_http/models/product/product_model.dart';
import 'package:working_with_http/services/product_http_services.dart';

class ProductController {
  final ProductHttpServices _productHttpServices = ProductHttpServices();

  Future<List<Product>> getProducts() async {
    List<Product> products = await _productHttpServices.fetchProducts();
    return products;
  }
}
