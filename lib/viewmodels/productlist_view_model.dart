import 'package:flutter/material.dart';
import 'package:flutter_task/api/response_model_class/product_list.dart';

import '../api/api_services/api_services.dart';


class ProductListViewModel extends ChangeNotifier {
  final ApiService _productService = ApiService();
  List<ProductList> products = [];

  Future<void> fetchProducts() async {
    try {
      products = await _productService.getProducts();
      notifyListeners();
    } catch (e) {
      // Handle error
      print('Error fetching products: $e');
    }
  }
}
