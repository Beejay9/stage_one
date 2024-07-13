import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stage_one/app/constants/app_colors.dart';
import 'package:stage_one/app/constants/app_text_style.dart';
import 'package:stage_one/app/constants/currency.dart';
import 'package:stage_one/app/constants/main_button.dart';
import 'package:stage_one/app/screens/checkout_screen.dart';
import 'package:stage_one/app/widget/cartscreen_item.dart';
import 'package:stage_one/providers/cart_provider.dart';
import 'package:stage_one/providers/product_providers.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});
  static const routeName = '/cartScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final cart = ref.read(cartProvider.notifier);
final cartItems = cart.cartFootwears;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'My Cart',
          style: AppTextStyle.bold(
            color: AppColors.mainTextColor,
            fontSize: 24.sp,
          ),
        ),
      ),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: cartItems.isEmpty
                ? const Center(
                    child: Text(
                      'Your bag is empty, add items!',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                  itemCount: cartItems.values.toList().length,
                  itemBuilder: (context, index) => CartScreenItem(
                    name: cartItems.values.toList()[index].name,
                    color: cartItems.values.toList()[index].color,
                    imageUrl:'${cartItems.values.toList()[index].imageUrl}',
                    price: cartItems.values.toList()[index].price,
                    quantity: cartItems.values.toList()[index].quantity,
                    size: cartItems.values.toList()[index].size,
                    
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total price',
                        style: AppTextStyle.regular(
                          color: AppColors.subTextColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      Gap(5.h),
                      Text(
                        '$getCurrency ${cart.totalAmount}',
                        style: AppTextStyle.medium(
                          color: AppColors.mainTextColor,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                  MainButton(
                    onPressed: () {
                      if (cartItems.isEmpty) {
                        return;
                      }
                      Navigator.of(context).pushNamed(
                        CheckoutScreen.routeName,
                      );
                    },
                    width: 0.35.sw,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/basket.svg',
                          height: 23.h,
                          width: 23.h,
                          color: AppColors.whiteColor,
                        ),
                        Gap(3.w),
                        Text(
                          'Checkout',
                          style: AppTextStyle.medium(
                            color: AppColors.whiteColor,
                            fontSize: 16.sp,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
