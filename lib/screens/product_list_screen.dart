import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';
import '../widgets/product_list.dart';

class ProductListScreen extends ConsumerWidget {
  final String categoryId;

  ProductListScreen({required this.categoryId});

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final products = watch(productProvider(categoryId));

    return Scaffold(
      appBar: AppBar(title: Text('Products in $categoryId')),
      body: products.when(
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text('Rp ${product.price}'),
              trailing: Column(
                children: [
                  Text(product.status),
                  Text('ID: ${product.idOrder}'),
                  Text('Items: ${product.totalItems}'),
                ],
              ),
              onTap: () {
                // Handle product tap
              },
            );
          },
        ),
        loading: () => CircularProgressIndicator(),
        error: (e, stack) => Text('Error: $e'),
      ),
    );
  }
}
