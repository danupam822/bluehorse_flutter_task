import 'package:flutter/material.dart';

import '../api/api_services/api_services.dart';
import '../api/response_model_class/product_details.dart';


class ProductDetailsViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  ProductDetails? _productDetails;

  ProductDetails? get productDetails => _productDetails;

  Future<void> fetchProductDetails(int productId) async {
    try {
      _productDetails = await _apiService.getProductDetails(productId);
      notifyListeners();
    } catch (e) {
      // Handle error
      print('Error fetching product details: $e');
    }
  }
}
