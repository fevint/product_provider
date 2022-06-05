import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_lime/data/models/res_product.dart';
import 'package:test_lime/data/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [];
  var _isLoading = true;
  var limit = 20;
  var totalData = 0;

  List<Product> get products => _products;
  set setProducts(List<Product> products) {
    _products.clear();
    _products.addAll(products);
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set setLoading(bool status) {
    _isLoading = status;
    notifyListeners();
  }

  void init() {
    Future.microtask(() => getProducts());
  }

  Future getProducts() async {
    try {
      setLoading = true;
      final data = await ProductService().getProducts(limit);
      totalData = data.total;
      setProducts = data.products;
      setLoading = false;
    } catch (e) {
      log(e.toString());
    }
  }

  Future loadMoreProducts() async {
    limit += 20;

    final data = await ProductService().getProducts(limit);

    setProducts = data.products;
  }
}
