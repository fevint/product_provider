import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_lime/modules/product/widgets/item_product_widget.dart';

import '../provider/product_provider.dart';

class ListProductWidget extends StatelessWidget {
  const ListProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final products = productProvider.products;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 3,
      ),
      itemCount: products.length == productProvider.totalData
          ? products.length
          : products.length + 1,
      itemBuilder: (context, index) {
        if (index >= products.length) {
          productProvider.loadMoreProducts();
          return const CircularProgressIndicator.adaptive();
        }
        return ItemProductWidget(product: products[index]);
      },
    );
  }
}
