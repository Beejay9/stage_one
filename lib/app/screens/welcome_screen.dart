import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stage_one/app/constants/app_colors.dart';
import 'package:stage_one/app/constants/app_text_style.dart';
import 'package:stage_one/app/constants/main_button.dart';
import 'package:stage_one/app/constants/shared.dart';
import 'package:stage_one/app/screens/home_screen.dart';
import 'package:stage_one/app/screens/product_details_screen.dart';
import 'package:stage_one/app/screens/product_screen.dart';
import 'package:stage_one/app/widget/form_field.dart';
import 'package:stage_one/providers/product_providers.dart';
import 'package:stage_one/providers/user_provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const routeName = './welcomeScreen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final formkey = GlobalKey<FormState>();
  // TextEditingController nameController = TextEditingController();
  // FocusNode emailFocusNode = FocusNode();
  // FocusNode passwordFocusNode = FocusNode();

  Map<String, String> initialValues = {
    'firstname': '',
    'lastname': '',
    'email': '',
    'number': '',
    'address': '',
  };

  // bool showPassword = false;
  final hasPressed = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 30.h,
              ),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: AppTextStyle.bold(
                        color: AppColors.mainTextColor,
                        fontSize: 25.sp,
                      ),
                    ),
                    // Gap(25.h),
                    Gap(20.h),
                    Text(
                      'Firstname',
                      style: AppTextStyle.medium(
                        color: AppColors.mainTextColor,
                        fontSize: 15.sp,
                      ),
                    ),
                    Gap(2.h),
                    MyTextField(
                      autocorrect: false,
                      hintText: 'enter your firstname',
                      keyboardType: TextInputType.emailAddress,
                      // controller: nameController,
                      // onFieldSubmitted: (value) {
                      //   FocusScope.of(context).requestFocus(emailFocusNode);
                      // },
                      onSaved: (newValue) => initialValues['firstname'] =
                          newValue.toString().trim(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '* Required field';
                        }
                        return null;
                      },
                    ),
                    Gap(20.h),
                    Text(
                      'Lastname',
                      style: AppTextStyle.medium(
                        color: AppColors.mainTextColor,
                        fontSize: 15.sp,
                      ),
                    ),
                    Gap(2.h),
                    MyTextField(
                      autocorrect: false,
                      hintText: 'enter your lastname',
                      // obscureText: showPassword ? false : true,
                      // focusNode: emailFocusNode,
                      // onFieldSubmitted: (value) {
                      //   FocusScope.of(context).requestFocus(passwordFocusNode);
                      // },
                      onSaved: (newValue) => initialValues['lastname'] =
                          newValue.toString().trim(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '* Required field';
                        }
                        return null;
                      },
                    ),
                    Gap(20.h),
                    Text(
                      'Phone Number',
                      style: AppTextStyle.medium(
                        color: AppColors.mainTextColor,
                        fontSize: 15.sp,
                      ),
                    ),
                    Gap(2.h),
                    MyTextField(
                      autocorrect: false,
                      hintText: 'enter your phone number',
                      keyboardType: TextInputType.emailAddress,
                      // controller: nameController,
                      // onFieldSubmitted: (value) {
                      //   FocusScope.of(context).requestFocus(emailFocusNode);
                      // },
                      onSaved: (newValue) =>
                          initialValues['number'] = newValue.toString().trim(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '* Required field';
                        }
                        return null;
                      },
                    ),
                    Gap(20.h),
                    Text(
                      'Email',
                      style: AppTextStyle.medium(
                        color: AppColors.mainTextColor,
                        fontSize: 15.sp,
                      ),
                    ),
                    Gap(2.h),
                    MyTextField(
                      autocorrect: false,
                      hintText: 'enter your email',
                      keyboardType: TextInputType.emailAddress,
                      // controller: nameController,
                      // onFieldSubmitted: (value) {
                      //   FocusScope.of(context).requestFocus(emailFocusNode);
                      // },
                      onSaved: (newValue) =>
                          initialValues['email'] = newValue.toString().trim(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '* Required field';
                        }
                        return null;
                      },
                    ),
                    Gap(20.h),
                    Text(
                      'City',
                      style: AppTextStyle.medium(
                        color: AppColors.mainTextColor,
                        fontSize: 15.sp,
                      ),
                    ),
                    Gap(2.h),
                    MyTextField(
                      autocorrect: false,
                      hintText: 'enter your (city, state) ',
                      keyboardType: TextInputType.emailAddress,
                      // controller: nameController,
                      // onFieldSubmitted: (value) {
                      //   FocusScope.of(context).requestFocus(emailFocusNode);
                      // },
                      onSaved: (newValue) =>
                          initialValues['address'] = newValue.toString().trim(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '* Required field';
                        }
                        return null;
                      },
                    ),
                    Gap(20.h),
                    // Gap(10.h),
                    Consumer(
                      builder: (context, ref, child) {
                        return ValueListenableBuilder(
                          valueListenable: hasPressed,
                          builder: (context, value, child) => MainButton(
                            onPressed: value
                                ? null
                                : () async {
                                    if (!formkey.currentState!.validate()) {
                                      return;
                                    }
                                    formkey.currentState!.save();
                                    hasPressed.value = true;
                                    await Shared.setUserFirstname(
                                        '${initialValues['firstname']}');
                                    await Shared.setUserLastname(
                                        '${initialValues['lastname']}');
                                    await Shared.setUserEmail(
                                        '${initialValues['email']}');
                                    await Shared.setUserphone(
                                        '${initialValues['number']}');
                                    await Shared.setUserCity(
                                        '${initialValues['address']}');
                                    await ref
                                        .read(productsProvider.notifier)
                                        .fetchProduct();
                                    hasPressed.value = false;
                                    await ref.read(userProvider.notifier).setUserDetails();
                                    Navigator.of(context).pushReplacementNamed(
                                      HomeScreen.routeName,
                                    );
                                  },
                            width: MediaQuery.of(context).size.width,
                            child: value
                                ? const CircularProgressIndicator(
                                    // context,
                                    color: AppColors.whiteColor,
                                  )
                                : Text(
                                    'Proceed',
                                    style: AppTextStyle.semiBold(
                                      color: AppColors.whiteColor,
                                      fontSize: 22.sp,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                    Gap(15.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
