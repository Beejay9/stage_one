import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stage_one/app/constants/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.width,
  });

  final void Function()? onPressed;
  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      onLongPress: null,
      style: TextButton.styleFrom(
        fixedSize: Size(width, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15).r,
        ),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        // elevation: 5,
      ),
      child: child,
    );
  }
}
