import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:stage_one/app/constants/app_colors.dart';
import 'package:stage_one/app/constants/app_text_style.dart';

class LogoItem extends StatelessWidget {
  const LogoItem({super.key, required this.svg, required this.brand});
  final String? svg;
  final String brand;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            height: 55.h,
            width: 55.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.imageBackgroundColor,
            ),
            child: SvgPicture.asset('$svg'),
          ),
          Gap(3.h),
          Text(
            brand,
            style: AppTextStyle.medium(
              color: AppColors.mainTextColor,
              fontSize: 12.sp
            ),
          )
        ],
      ),
    );
  }
}
