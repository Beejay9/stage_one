import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stage_one/app/screens/cart_screen.dart';
import 'package:stage_one/app/screens/checkout_screen.dart';
import 'package:stage_one/app/screens/home_screen.dart';
import 'package:stage_one/app/screens/product_details_screen.dart';
import 'package:stage_one/app/screens/product_screen.dart';
import 'package:stage_one/app/screens/spalash_screen.dart';
import 'package:stage_one/app/screens/success_screen.dart';
import 'package:stage_one/app/screens/welcome_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      designSize: const Size(390, 844),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
        routes: {
          WelcomeScreen.routeName: (context) => WelcomeScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          ProductScreen.routeName: (context) => ProductScreen(),
          ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          CheckoutScreen.routeName: (context) =>CheckoutScreen(),
          SuccessScreen.routeName: (context) => SuccessScreen(),
        },
      ),
    );
  }
}
