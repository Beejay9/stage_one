import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:stage_one/app/constants/app_colors.dart';
import 'package:stage_one/app/constants/app_text_style.dart';
import 'package:stage_one/app/constants/currency.dart';
import 'package:stage_one/app/constants/main_button.dart';
import 'package:stage_one/app/screens/cart_screen.dart';
import 'package:stage_one/app/screens/product_details_screen.dart';

class HomeScreenItem extends StatelessWidget {
  const HomeScreenItem({
    super.key,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.unitSold,
    required this.rating,
    this.isPromo = false,
  });
  final String id;
  final String name;
  final String imageUrl;
  final String category;
  final double price;
  final double unitSold;
  final double rating;
  final bool isPromo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailsScreen.routeName,
          arguments: id,
        );
      },
      child: Container(
        // height: 470.h,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        width: 0.47.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180.h,
              decoration: BoxDecoration(
                color: AppColors.imageBackgroundColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: 'http://api.timbu.cloud/images/$imageUrl',
                  height: 120.h,
                ),
              ),
            ),
            Gap(7.h),
            Text(
              category,
              style: AppTextStyle.regular(
                  color: AppColors.mainTextColor, fontSize: 12.sp),
            ),
            Text(
              name,
              style: AppTextStyle.medium(
                  color: AppColors.mainTextColor, fontSize: 14.sp),
            ),
            Gap(3.h),
            Row(
              children: [
                Text(
                  '$rating ($unitSold)',
                  style: AppTextStyle.regular(
                    color: AppColors.mainTextColor,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      '$getCurrency $price',
                      style: AppTextStyle.medium(
                        color: AppColors.primaryColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    if (isPromo)
                      Stack(
                        children: [
                          Text(
                            '$getCurrency ${price + 5000}',
                            style: AppTextStyle.medium(
                              color: AppColors.subTextColor,
                              fontSize: 14.sp,
                            ),
                          ),
                          // horizo
                        ],
                      ),
                  ],
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.primaryColor.withOpacity(0.12),
                  ),
                  child: SvgPicture.asset(
                    'assets/svg/basket.svg',
                    height: 23.h,
                    width: 23.h,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({
    super.key,
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
  });
  final String id;
  final String name;
  final String category;
  final double price;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushNamed(
        //   CartScreen.routeName,
        // );
      },
      child: Container(
        margin: EdgeInsets.all(15.r),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color(0xff0072C6),
              Color(0xff003760),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 200.h,
              width: 150.h,
              child: CachedNetworkImage(
                imageUrl: 'http://api.timbu.cloud/images/$imageUrl',
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: AppTextStyle.regular(
                    color: AppColors.whiteColor,
                    fontSize: 12.sp,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      name,
                      style: AppTextStyle.medium(
                        color: AppColors.whiteColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    Gap(5.w),
                    Text(
                      '$getCurrency $price',
                      style: AppTextStyle.medium(
                        color: AppColors.whiteColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: MainButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        ProductDetailsScreen.routeName,
                        arguments: id,
                      );
                      // if (itemValue > 0) {
                      //   ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //       content: Text(
                      //         'Product already added to cart already',
                      //       ),
                      //     ),
                      //   );
                      //   return;
                      // }
                      // if (selectedSize == null || selectedColor == null) {
                      //   ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //       content: Text(
                      //         'Please select size and color',
                      //       ),
                      //     ),
                      //   );
                      //   return;
                      // }

                      // cart.addToCart(
                      //   '${product['id']}',
                      //   '${product['name']}',
                      //   itemValue,
                      //   selectedColor as Color,
                      //   'http://api.timbu.cloud/images/${product['photos'][0]['url']}',
                      //   selectedSize as int,
                      //   product['current_price']?[0]['NGN'][0],
                      // );
                      // ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     content: Text(
                      //       'Product added to cart',
                      //     ),
                      //   ),
                      // );
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
                          'Add to Cart',
                          style: AppTextStyle.medium(
                            color: AppColors.whiteColor,
                            fontSize: 16.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
