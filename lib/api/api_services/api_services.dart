import 'dart:convert';

import 'package:flutter_task/api/response_model_class/product_list.dart';
import 'package:http/http.dart' as http;

import '../response_model_class/product_details.dart';

class ApiService{
  static const String baseUrl = 'https://fakestoreapi.com';

  Future<List<ProductList>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<ProductList> products = data.map((json) => ProductList.fromJson(json)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<ProductDetails> getProductDetails(int productId) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$productId'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return ProductDetails.fromJson(data);
    } else {
      throw Exception('Failed to load product details');
    }
  }
}