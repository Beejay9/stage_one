import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductRepository extends ChangeNotifier {
  List<dynamic> products = [];
  List<dynamic> selectedProducts = [];
  bool isLoading = false;
  bool fetchData = false;
  List cartProduct = [];
  Future<bool> fetchProduct() async {
    try {
      const apiKey = '68b414f58e8b488885a93b29eb78ff9320240710151345626512';
      const apiId = 'CGL0MHNKC6994BN';
      const organizationId = '7d9356c8bd3f4b3c9c47fab30da9ef8f';
      final url = Uri.parse(
        'https://api.timbu.cloud/products?organization_id=$organizationId&reverse_sort=false&page=1&size=12&Appid=$apiId&Apikey=$apiKey',
      );
      final response = await http.get(url);
      // debugPrint('product response is ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final fetchedProducts = data['items'] as List;
       
        products = fetchedProducts;
         debugPrint('products is ${products}');
         return true;
      }
      return true;
    } catch (e) {
      debugPrint('fetch product error is $e');
      return false;
    }
  }
}
