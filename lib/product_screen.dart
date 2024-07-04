import 'package:flutter/material.dart';
import 'package:stage_one/dummy.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  static const routeName = '/productScreen';
  // List selectedProducts = [];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
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
          itemCount: products.length,
          itemBuilder: (context, index) => homeScreenItem(
            '${products[index]['title']}',
            products[index]['price'] as double,
            '${products[index]['description']}',
            () {
              // selectedProducts.insert(
              //   0,
              //   products[index],
              // );
              selectedProductItems.insert(
                0,
                products[index],
              );
              debugPrint('selectedproduct is $selectedProductItems');
            },
            context,
          ),
        ),
      ),
    );
  }
}

Widget homeScreenItem(
  String title,
  double price,
  String description,
  void Function()? onTap,
  BuildContext context,
  {bool isCart = false}
) {
  return Container(
    margin: const EdgeInsets.only(
      left: 15,
      right: 15,
      top: 15,
    ),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
        color: Colors.cyan, borderRadius: BorderRadius.circular(20)),
    height: MediaQuery.of(context).size.height * 0.18,
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
            Text(
              '\$$price',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white),
            ),
          ],
        ),
        Text(
          description,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: onTap,
            child: Text(
             isCart? 'Remove' : 'Add',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            style: ElevatedButton.styleFrom(foregroundColor: Colors.cyan),
          ),
        ),
      ],
    ),
  );
}
