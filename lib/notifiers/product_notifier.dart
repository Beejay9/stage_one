import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductRepository extends ChangeNotifier {
  List<dynamic> products = [];
  List<dynamic> selectedProducts = [];
  bool isLoading = false;
  bool fetchData = false;
  Future<void> fetchProduct() async {
    try {
      isLoading = true;
      const apiKey = '*********************************';
      const apiId = '******************';
      const organizationId = '******************';
      final url = Uri.parse(
        'https://api.timbu.cloud/products?organization_id=$organizationId&reverse_sort=false&page=1&size=10&Appid=$apiId&Apikey=$apiKey',
      );
      final response = await http.get(url);
      // debugPrint('product response is ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final fetchedProducts = data['items'] as List;
       
        products = fetchedProducts;
         debugPrint('products is ${products}');
         fetchData = true;
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
     fetchData = false;
      debugPrint('fetch product error is $e');
      
    }
  }
}
