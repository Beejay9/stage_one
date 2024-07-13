import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stage_one/app/constants/app_colors.dart';
import 'package:stage_one/app/screens/cart_screen.dart';
import 'package:stage_one/app/screens/product_screen.dart';

// class HomeScreen extends StatefulWidget {
//   HomeScreen({super.key                    });
//   static const routeName = '/homeScreen';

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {

// }

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/homeScreen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final screens = [
    ProductScreen(),
    CartScreen(),
  ];

  int selectedIndex = 0;

  void selectScreen(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    // ref.read(productsProvider.notifier).fetchProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: selectScreen,
        selectedItemColor: AppColors.primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
            ),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
