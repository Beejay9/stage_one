import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stage_one/providers/product_providers.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});
  static const routeName = '/productScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final products = ref.read(productsProvider.notifier).products;
    // final products = ref.read(productProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
        // child: ref.read(productProvider)
        child:
            //  products.when(
            //   data: (product) {
            //     if (product.isEmpty) {
            //       return Center(
            //         child: Text('No products found'),
            //       );
            //     }
            //     return ListView.builder(
            //       itemCount: product.length,
            //       itemBuilder: (context, index) => homeScreenItem(
            //         '${product[index]['name']}',
            //         product[index]['current_price']?[0]['NGN'][0] as double,
            //         '${product[index]['description']}',
            //         () {
            //           // selectedProducts.insert(
            //           //   0,
            //           //   products[index],
            //           // );
            //           // selectedProductItems.insert(
            //           //   0,
            //           //   products[index],
            //           // );
            //           // debugPrint('selectedproduct is $selectedProductItems');
            //         },
            //         context,
            //       ),
            //     );
            //   },
            //   error: (e, stacktrace) {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(
            //         content: Text(
            //           'An error occured, Please pull down to try again',
            //         ),
            //       ),
            //     );
            //   },
            //   loading: () {
            //     return SizedBox(
            //       height: 35,
            //       width: 35,
            //     );
            //   },
            // ),
            // FutureBuilder(
            //     future: ref.read(productsProvider.notifier).fetchProduct(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return SizedBox(
            //           height: 35,
            //           width: 35,
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //       // if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //       //   return Center(
            //       //     child: Text('No products found'),
            //       //   );
            //       // }
            //       debugPrint(
            //         'this is from products screen ${ref.read(
            //           productsProvider.notifier,
            //         ).products}',
            //       );
            //       // debugPrint(
            //       //   'this is the price of laptop bag ${products[0]['current_price'][0]['NGN'][0]}',
            //       // );
            //       return
            ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  if (products.isEmpty || products == null) {
                    return Center(
                      child: Text('No products found'),
                    );
                  }

                  if (ref.read(productsProvider.notifier).isLoading) {
                    return SizedBox(
                      height: 10,
                      width: 10,
                      child: CircularProgressIndicator(),
                    );
                  }
                  return homeScreenItem(
                    '${products[index]['name']}',
                    products[index]['current_price']?[0]['NGN'][0] as double,
                    '${products[index]['description']}',
                    '${products[index]['photos'][0]['url']}',
                    () {
                      ref
                          .read(productsProvider.notifier)
                          .selectedProducts
                          .insert(
                            0,
                            products[index],
                          );
                      //  ref.read(productsProvider.notifier).selectedProductItems.insert(
                      //     0,
                      //     products[index],
                      //   );
                      debugPrint(
                        'selectedproduct is ${ref.read(productsProvider.notifier).selectedProducts}',
                      );
                    },
                    context,
                  );
                }),
        //     }),
      ),
    );
  }
}

Widget homeScreenItem(String title, double price, String description,
    String imageUrl, void Function()? onTap, BuildContext context,
    {bool isCart = false}) {
  return Container(
    margin: const EdgeInsets.only(
      left: 15,
      right: 15,
      top: 15,
    ),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.cyan,
      borderRadius: BorderRadius.circular(20),
    ),
    height: MediaQuery.of(context).size.height * 0.22,
    width: MediaQuery.of(context).size.width,
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.17,
          width: MediaQuery.of(context).size.height * 0.12,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'http://api.timbu.cloud/images/$imageUrl',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Text(
                description,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.white,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$$price',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  onPressed: onTap,
                  child: Text(
                    isCart ? 'Remove' : 'Add',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.cyan),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
