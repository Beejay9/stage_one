// import 'dart:ffi';

import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stage_one/app/constants/app_colors.dart';
import 'package:stage_one/app/constants/app_text_style.dart';
import 'package:stage_one/app/constants/currency.dart';
import 'package:stage_one/app/constants/main_button.dart';
import 'package:stage_one/providers/cart_provider.dart';
import 'package:stage_one/providers/product_providers.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  const ProductDetailsScreen({super.key});
  static const routeName = '/productDetailsScreen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  final List sizes = [
    32,
    35,
    38,
    39,
    40,
    42,
    45,
  ];
  final List colors = [
    Colors.orange[400],
    Colors.purple[400],
    Colors.green[600],
    Colors.yellow[400],
    Colors.blue[600],
    Colors.red[600],
    Colors.black
  ];

  Color? selectedColor;

  int itemValue = 0;
  int? selectedSize;
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final products = ref.read(productsProvider.notifier).products;
    final cart = ref.read(cartProvider.notifier);
    final product = products.firstWhere(
      (element) => element['id'] == productId,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.imageBackgroundColor,
        elevation: 0,
      ),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.imageBackgroundColor,
                padding: EdgeInsets.all(20.r),
                height: 0.35.sh,
                width: 1.sw,
                child: CachedNetworkImage(
                  imageUrl:
                      'http://api.timbu.cloud/images/${product['photos'][0]['url']}',
                ),
              ),
              Gap(10.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Text(
                  '${product['categories'][0]['name'].toString().capitalize}',
                  style: AppTextStyle.regular(
                    color: AppColors.mainTextColor,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Gap(5.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${product['name']}',
                      style: AppTextStyle.semiBold(
                        color: AppColors.mainTextColor,
                        fontSize: 24.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFav = !isFav;
                        });
                      },
                      child: SvgPicture.asset('assets/svg/fav.svg'),
                    ),
                  ],
                ),
              ),
              Gap(5.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Text(
                  '$getCurrency ${product['current_price']?[0]['NGN'][0]}',
                  style: AppTextStyle.medium(
                    color: AppColors.mainTextColor,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              Gap(10.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Row(
                  children: [
                    Text(
                      '100 sold',
                      style: AppTextStyle.regular(
                        color: AppColors.descriptionColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    Gap(7.w),
                    SvgPicture.asset('assets/svg/rating.svg'),
                    Gap(2.w),
                    Text(
                      '4.5 (54 reviews)',
                      style: AppTextStyle.regular(
                        color: AppColors.descriptionColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Text(
                  'Description',
                  style: AppTextStyle.medium(
                    color: AppColors.mainTextColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Gap(3.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Text(
                  '${product['description']}',
                  style: AppTextStyle.regular(
                    color: AppColors.descriptionColor,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Gap(7.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Text(
                  'Size',
                  style: AppTextStyle.medium(
                    color: AppColors.mainTextColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Gap(3.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Wrap(
                  // scrollDirection: ScrollDirection.ho,
                  alignment: WrapAlignment.start,
                  spacing: 6.w,
                  children: sizes
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = e;
                            });
                          },
                          child: Container(
                            // height: 15.h,
                            // width: 15.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 13.r,
                              vertical: 8.h,
                            ),
                            margin: EdgeInsets.only(right: 5.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: selectedSize == e
                                  ? AppColors.primaryColor
                                  : AppColors.imageBackgroundColor,
                            ),
                            child: Text(
                              '$e',
                              style: AppTextStyle.regular(
                                color: selectedSize == e
                                    ? AppColors.imageBackgroundColor
                                    : AppColors.mainTextColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Gap(10.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Text(
                  'Colours',
                  style: AppTextStyle.medium(
                    color: AppColors.mainTextColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Gap(3.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Wrap(
                  // scrollDirection: ScrollDirection.ho,
                  alignment: WrapAlignment.start,
                  spacing: 6.w,
                  children: colors
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = e;
                            });
                          },
                          child: Container(
                            height: 30.h,
                            width: 30.h,
                            // padding: EdgeInsets.symmetric(
                            //   // horizontal: 13.r,
                            //   // vertical: 8.h,
                            // ),
                            margin: EdgeInsets.only(right: 5.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: e,
                            ),
                            child: selectedColor == e
                                ? Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Gap(10.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Text(
                  'Quantity',
                  style: AppTextStyle.medium(
                    color: AppColors.mainTextColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Gap(3.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Container(
                  width: 0.32.sw,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.r,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.imageBackgroundColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (itemValue == 0) {
                            return;
                          }
                          setState(() {
                            itemValue--;
                          });

                          cart.removeSingleItem(
                            '${product['id']}',
                          );
                        },
                        child: Icon(Icons.remove),
                      ),
                      Text(
                        '$itemValue',
                        style: AppTextStyle.regular(
                          color: AppColors.descriptionColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
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
                          if (itemValue == 0) {
                            return;
                          }
                          setState(() {
                            itemValue++;
                          });

                          cart.addToCart(
                            '${product['id']}',
                            '${product['name']}',
                            itemValue,
                            selectedColor as Color,
                            'http://api.timbu.cloud/images/${product['photos'][0]['url']}',
                            selectedSize as int,
                            product['current_price']?[0]['NGN'][0],
                          );
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(20.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Text(
                  'More from Ego',
                  style: AppTextStyle.bold(
                    color: AppColors.mainTextColor,
                    fontSize: 24.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'No other products at the moment',
                    style: AppTextStyle.regular(
                      color: AppColors.mainTextColor,
                      fontSize: 17.sp,
                    ),
                  ),
                ),
              ),
              Gap(50.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
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
                        if (itemValue > 0) {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Product already added to cart already',
                              ),
                            ),
                          );
                          return;
                        }
                        if (selectedSize == null || selectedColor == null) {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please select size and color',
                              ),
                            ),
                          );
                          return;
                        }
                        setState(() {
                          itemValue++;
                        });
                        cart.addToCart(
                          '${product['id']}',
                          '${product['name']}',
                          itemValue,
                          selectedColor as Color,
                          'http://api.timbu.cloud/images/${product['photos'][0]['url']}',
                          selectedSize as int,
                          product['current_price']?[0]['NGN'][0],
                        );
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Product added to cart',
                            ),
                          ),
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
                            'Add to Cart',
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
      ),
    );
  }
}