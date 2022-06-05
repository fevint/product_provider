import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_lime/modules/product/pages/product_page.dart';

import 'modules/product/provider/product_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductPage(),
      ),
    );
  }
}
