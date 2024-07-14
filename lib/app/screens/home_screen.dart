import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stage_one/app/constants/app_colors.dart';
import 'package:stage_one/app/constants/app_text_style.dart';
import 'package:stage_one/app/screens/all_products.dart';
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
    AllProducts(),
    CartScreen(),
    AllProducts(),
    AllProducts(),
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
      backgroundColor: Colors.white,
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
         backgroundColor: Colors.white,
        showUnselectedLabels: true,
        unselectedLabelStyle: AppTextStyle.regular(
          color: Colors.black,
        ),
        unselectedFontSize: 14,
        selectedFontSize: 14,
        showSelectedLabels: true,
        unselectedIconTheme: IconThemeData(),
        selectedIconTheme: IconThemeData(),
        currentIndex: selectedIndex,
        onTap: selectScreen,
        selectedItemColor: AppColors.primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/home-06.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/dashboard.svg'),
            label: 'All Products',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/shopping.svg'),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/user.svg'),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/user.svg'),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
