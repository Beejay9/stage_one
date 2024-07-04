import 'package:flutter/material.dart';
import 'package:stage_one/home_screen.dart';
import 'package:stage_one/product_screen.dart';
import 'package:stage_one/success_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        ProductScreen.routeName: (context) => ProductScreen(),
        // CartScreen.routeName: (context) => CartScreen(),
        SuccessScreen.routeName: (context) => SuccessScreen(),
      },
    );
  }
}
