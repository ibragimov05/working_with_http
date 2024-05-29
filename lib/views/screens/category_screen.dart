import 'package:flutter/material.dart';
import 'package:working_with_http/controllers/categoryY_controller.dart';
import 'package:working_with_http/models/category/categoryY_model.dart';
import 'package:working_with_http/views/widgets/custom_grid_view_builder.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final CategoryYController _categoryYController = CategoryYController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _categoryYController.getCategories(),
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
            final List<CategoryY> categories = snapshot.data;
            return CustomGridViewBuilder(
              objectList: categories,
              isSelected: false,
            );
          }
        },
      ),
    );
  }
}
