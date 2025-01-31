import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:stage_one/app/constants/app_colors.dart';
import 'package:stage_one/app/constants/app_text_style.dart';
import 'package:stage_one/app/constants/currency.dart';

class CartScreenItem extends StatelessWidget {
  const CartScreenItem({
    super.key,
    required this.name,
    required this.color,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.size,
    required this.onDecrease,
    required this.onIncrease,
    required this.onRemove,
    this.isCheckout = false,
  });
  final String name;
  final Color color;
  final String imageUrl;
  final double price;
  final int quantity;
  final int size;
  final bool isCheckout;
  final void Function()? onDecrease;
  final void Function()? onIncrease;
  final void Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 227, 227, 227),
          ),
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: 200.h,
            width: 0.28.sw,
            padding: EdgeInsets.all(25.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.r,
              ),
              color: AppColors.imageBackgroundColor,
            ),
            child: CachedNetworkImage(
              imageUrl: '$imageUrl',
            ),
          ),
          Gap(10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(12.h),
              SizedBox(
                width: 0.5.sw,
                child: Text(
                  name,
                  style: AppTextStyle.medium(
                    color: AppColors.mainTextColor,
                    fontSize: 16.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Gap(10.h),
              Row(
                children: [
                  Container(
                    height: 20.h,
                    width: 20.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 13.r,
                      vertical: 8.h,
                    ),
                    margin: EdgeInsets.only(right: 5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: color,
                    ),
                    // child: Text('$e'),
                  ),
                  Text(
                    'Blue',
                    style: AppTextStyle.regular(
                      color: AppColors.subTextColor,
                    ),
                  ),
                  Gap(7.w),
                  SvgPicture.asset('assets/svg/line.svg'),
                  Gap(7.w),
                  Text(
                    'Size',
                    style: AppTextStyle.regular(
                        color: AppColors.mainTextColor, fontSize: 15),
                  ),
                  Gap(3.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.imageBackgroundColor,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text(
                      '$size',
                      style: AppTextStyle.regular(
                        color: AppColors.mainTextColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: !isCheckout ? 0.25.sw : null,
                    padding: EdgeInsets.symmetric(
                      horizontal: isCheckout ? 10.w : 8.w,
                      vertical: isCheckout ? 5.h : 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: isCheckout
                          ? Color.fromARGB(255, 203, 230, 249)
                          : AppColors.imageBackgroundColor,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (!isCheckout)
                          GestureDetector(
                            onTap: onDecrease,
                            child: Icon(Icons.remove),
                          ),
                        Text(
                          '$quantity',
                          style: AppTextStyle.regular(
                            color: AppColors.descriptionColor,
                            fontSize: 14.sp,
                          ),
                        ),
                        if (!isCheckout)
                          GestureDetector(
                            onTap: onIncrease,
                            child: Icon(
                              Icons.add,
                              weight: 0.5,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Gap(10.w),
                  SvgPicture.asset('assets/svg/line.svg'),
                  Gap(7.w),
                  Text(
                    ' $getCurrency $price',
                    style: AppTextStyle.medium(
                      color: AppColors.mainTextColor,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
          if (!isCheckout)
            GestureDetector(
              onTap: onRemove,
              child: SvgPicture.asset('assets/svg/cancel.svg'),
            )
        ],
      ),
    );
  }
}
