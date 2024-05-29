import 'package:flutter/material.dart';
import 'package:working_with_http/controllers/product_controller.dart';
import 'package:working_with_http/models/product/product_model.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final ProductController _productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: FutureBuilder(
          future: _productController.getProducts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData ||
                snapshot.hasError ||
                snapshot.data == null) {
              return const Center(
                child: Text('error: snapshot'),
              );
            } else {
              final List<Product> products = snapshot.data;
              return GridView.builder(
                itemCount: 18,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        products[index].productImages[0],
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          }
                        },
                      ),
                      Text(
                        products[index].productTitle,
                        textAlign: TextAlign.center,
                      ),
                      Text(products[index].productCategory.name),
                      Text('\$${products[index].productPrice}'),
                    ],
                  );
                },
              );
            }
          }),
    );
  }
}
