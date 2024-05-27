import 'package:flutter/material.dart';
import '../models/category.dart';
import '../screens/product_list_screen.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  CategoryList({required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return ListTile(
          title: Text(category.name),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProductListScreen(categoryId: category.id)),
            );
          },
        );
      },
    );
  }
}
