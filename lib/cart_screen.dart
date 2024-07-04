import 'package:flutter/material.dart';
import 'package:stage_one/dummy.dart';
import 'package:stage_one/product_screen.dart';
import 'package:stage_one/success_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });
  static const routeName = '/cartScreen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // final List cartProducts;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.white,
        child: ListView.builder(
          itemCount: selectedProductItems.length,
          itemBuilder: (context, index) => selectedProductItems.isEmpty
              ? const Center(
                  child: Text(
                    'No products yet. Please add products',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.cyan,
                    ),
                  ),
                )
              : homeScreenItem(
                  selectedProductItems[index]['title'],
                  selectedProductItems[index]['price'],
                  selectedProductItems[index]['description'], () {
                  selectedProductItems.removeAt(index);
                  setState(() {});
                }, context, isCart: true),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {
          if (selectedProductItems.isEmpty) {
            return;
          }
          setState(() {
            selectedProductItems.clear();
          });
          
          Navigator.of(context).pushNamed(
            SuccessScreen.routeName,
          );
        },
        child: const Text(
          'Order',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
