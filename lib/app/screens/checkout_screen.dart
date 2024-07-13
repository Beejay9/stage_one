import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stage_one/app/constants/app_colors.dart';
import 'package:stage_one/app/constants/app_text_style.dart';
import 'package:stage_one/app/constants/currency.dart';
import 'package:stage_one/app/constants/main_button.dart';
import 'package:stage_one/app/widget/cartscreen_item.dart';
import 'package:stage_one/providers/cart_provider.dart';
import 'package:stage_one/providers/product_providers.dart';
import 'package:stage_one/providers/user_provider.dart';

class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({super.key});
  static const routeName = '/checkoutScreen';

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.read(cartProvider.notifier);
    final cartItems = cart.cartFootwears;
    final user = ref.read(userProvider.notifier);
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 0.8.sh,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: ListView.builder(
                    itemCount: cartItems.values.toList().length,
                    itemBuilder: (context, index) => CartScreenItem(
                      name: cartItems.values.toList()[index].name,
                      color: cartItems.values.toList()[index].color,
                      imageUrl: cartItems.values.toList()[index].imageUrl,
                      price: cartItems.values.toList()[index].price,
                      quantity: cartItems.values.toList()[index].quantity,
                      size: cartItems.values.toList()[index].size,
                    ),
                  ),
                ),
              ),
              // Column(
              //   children: [
                
              //   ],
              // )
              Gap(20.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                
                    Text(
                      'Personal information',
                      style: AppTextStyle.medium(
                        color: AppColors.mainTextColor,
                        fontSize: 16.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Edit',
                        style: AppTextStyle.medium(
                          color: AppColors.primaryColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Gap(10.h),
              Container(
                padding: EdgeInsets.all(15.r),
                margin: EdgeInsets.symmetric(horizontal: 15.w,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.imageBackgroundColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${user.firstname} ${user.lastname}',
                          style: AppTextStyle.medium(
                            color: AppColors.mainTextColor,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          '${user.email}',
                          style: AppTextStyle.medium(
                            color: AppColors.mainTextColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${user.number}',
                      style: AppTextStyle.medium(
                        color: AppColors.mainTextColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery option',
                      style: AppTextStyle.medium(
                        color: AppColors.mainTextColor,
                        fontSize: 16.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Edit',
                        style: AppTextStyle.medium(
                          color: AppColors.primaryColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Gap(10.h),
              Container(
                padding: EdgeInsets.all(15.r),
                margin: EdgeInsets.symmetric(horizontal: 15.w,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.imageBackgroundColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pickup Point',
                      style: AppTextStyle.medium(
                        color: AppColors.mainTextColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      '${user.address}',
                      style: AppTextStyle.medium(
                        color: AppColors.mainTextColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: 15.w,),
                  child: Text(
                    'Price Summary',
                    style: AppTextStyle.medium(
                      color: AppColors.mainTextColor,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
              Gap(10.h),
              Container(
                padding: EdgeInsets.all(15.r),
                margin: EdgeInsets.symmetric(horizontal: 15.w,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.imageBackgroundColor,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price',
                          style: AppTextStyle.medium(
                            color: AppColors.subTextColor,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          '$getCurrency ${cart.totalAmount}',
                          style: AppTextStyle.medium(
                            color: AppColors.mainTextColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    Gap(5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Fee',
                          style: AppTextStyle.medium(
                            color: AppColors.subTextColor,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          '$getCurrency 1,000',
                          style: AppTextStyle.medium(
                            color: AppColors.mainTextColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    Gap(5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount',
                          style: AppTextStyle.medium(
                            color: AppColors.subTextColor,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          '$getCurrency 0.00',
                          style: AppTextStyle.medium(
                            color: AppColors.mainTextColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: AppTextStyle.medium(
                            color: AppColors.subTextColor,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          '$getCurrency ${cart.totalAmount}',
                          style: AppTextStyle.medium(
                            color: AppColors.mainTextColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Gap(30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: AppColors.imageBackgroundColor,
                        
                        borderRadius: BorderRadius.circular(
                          5.r,
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: AppTextStyle.regular(
                          color: AppColors.mainTextColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    MainButton(
                      onPressed: () {},
                      width: 0.25
                      .sw,
                      child: Row(
                        children: [
                          // SvgPicture.asset(
                          //   'assets/svg/basket.svg',
                          //   height: 23.h,
                          //   width: 23.h,
                          //   color: AppColors.whiteColor,
                          // ),
                          // Gap(3.w),
                          Text(
                            'Proceed',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
