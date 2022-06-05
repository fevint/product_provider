import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_lime/data/models/res_product.dart';

class ProductService {
  final String baseUrl = "https://dummyjson.com/";

  Future<ResProduct> getProducts(int limit) async {
    var url = Uri.parse("${baseUrl}products?limit=$limit&skip=0");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final data = response.body;
      return ResProduct.fromJson(json.decode(data));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
