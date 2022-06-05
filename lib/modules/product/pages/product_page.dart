import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_lime/modules/product/provider/product_provider.dart';
import 'package:test_lime/modules/product/widgets/list_product_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("List Products"),
        ),
      ),
      body: SafeArea(
        child: Consumer<ProductProvider>(builder: (context, state, widget) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return const ListProductWidget();
        }),
      ),
    );
  }
}
