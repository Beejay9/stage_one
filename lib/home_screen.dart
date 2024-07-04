import 'package:flutter/material.dart';
import 'package:stage_one/cart_screen.dart';
import 'package:stage_one/product_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key                    });
  static const routeName = '/homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: selectScreen,
        selectedItemColor: Colors.cyan,
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
