import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stage_one/notifiers/product_notifier.dart';
import 'package:http/http.dart' as http;

final productsProvider = ChangeNotifierProvider<ProductRepository>((ref) {
  return ProductRepository();
});