import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:stage_one/app/constants/app_colors.dart';
import 'package:stage_one/app/constants/app_text_style.dart';
import 'package:stage_one/app/constants/main_button.dart';
import 'package:stage_one/app/screens/home_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});
  static const routeName = '/successScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/check.svg'),
               Gap(10.h),
              Text(
                'Payment Successful ',
                style: AppTextStyle.regular(
                  color: AppColors.mainTextColor,
                  fontSize: 17,
                ),
              ),
               Gap(10.h),
              Text(
                'You have successfully placed an order. Details of your order has been sent to your email.',
                style: AppTextStyle.regular(
                  color: AppColors.subTextColor,
                  fontSize: 14,
                ),
              ),
              Gap(40.h),
              MainButton(
                  child: Text(
                    'Continue Shopping',
                    style: AppTextStyle.medium(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  onPressed: () {
                    Get.offAll(
                      () => HomeScreen(),
                    );
                  },
                  width: 1.sw)
            ],
          ),
        ),
      ),
    );
  }
}
