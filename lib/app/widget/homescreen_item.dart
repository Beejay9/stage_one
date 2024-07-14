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
              child: Stack(
                children: [
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      padding: EdgeInsets.all(5.r),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.subTextColor,
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: 'http://api.timbu.cloud/images/$imageUrl',
                      height: 120.h,
                    ),
                  ),
                ],
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
                SvgPicture.asset(
                  'assets/svg/rating.svg',
                ),
                Gap(2.w),
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
    required this.colors,
    required this.imageUrl,
    this.textColor,
  });
  final String id;
  final String name;
  final String category;
  final double price;
  final List<Color> colors;
  final Color? textColor;
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
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 200.h,
              width: 125.w,
              child: CachedNetworkImage(
                imageUrl: 'http://api.timbu.cloud/images/$imageUrl',
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    category,
                    style: AppTextStyle.regular(
                      color: textColor ?? AppColors.whiteColor,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      name,
                      style: AppTextStyle.medium(
                        color: textColor ?? AppColors.whiteColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    Gap(5.w),
                    Text(
                      '$getCurrency $price',
                      style: AppTextStyle.medium(
                        color: textColor ?? AppColors.whiteColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                Gap(10.h),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
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
                    width: 0.34.sw,
                    backgroundColor: textColor ?? Colors.white,
                    foregroundColor: textColor == null
                        ? AppColors.primaryColor
                        : Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/basket.svg',
                          height: 23.h,
                          width: 23.h,
                          color: textColor == null
                                ? AppColors.primaryColor
                                : Colors.white,
                        ),
                        Gap(3.w),
                        Text(
                          'Add to Cart',
                          style: AppTextStyle.medium(
                            color: textColor == null
                                ? AppColors.primaryColor
                                : Colors.white,
                            fontSize: 12.sp,
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
