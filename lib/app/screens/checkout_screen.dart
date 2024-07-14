import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stage_one/app/constants/app_colors.dart';
import 'package:stage_one/app/constants/app_text_style.dart';
import 'package:stage_one/app/constants/currency.dart';
import 'package:stage_one/app/constants/main_button.dart';
import 'package:stage_one/app/screens/success_screen.dart';
import 'package:stage_one/app/widget/cartscreen_item.dart';
import 'package:stage_one/app/widget/form_field.dart';
import 'package:stage_one/providers/cart_provider.dart';
import 'package:stage_one/providers/product_providers.dart';
import 'package:stage_one/providers/user_provider.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});
   static const routeName = '/checkoutScreen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {

  @override
  Widget build(BuildContext context) {
    final cart = ref.read(cartProvider.notifier);
    final cartItems = cart.cartFootwears;
    final user = ref.read(userProvider.notifier);

    Map<String, String> initialValues = {
      'firstname': '',
      'lastname': '',
      'email': '',
      'number': '',
      'address': '',
    };

     int itemValue = 0;

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
                      onDecrease: () {
                            if (itemValue == 0) {
                              return;
                            }
                            itemValue =
                                cartItems.values.toList()[index].quantity;
                            setState(() {
                              itemValue--;
                            });

                            cart.removeSingleItem(
                              '${cartItems.values.toList()[index].id}',
                            );
                          },
                          onIncrease: () {
                            itemValue =
                                cartItems.values.toList()[index].quantity;
                            if (cartItems.values.toList()[index].quantity ==
                                0) {
                              return;
                            }
                            setState(() {
                              itemValue++;
                            });

                            cart.addToCart(
                              '${cartItems.values.toList()[index].id}',
                              '${cartItems.values.toList()[index].name}',
                              cartItems.values.toList()[index].quantity,
                              cartItems.values.toList()[index].color,
                              'http://api.timbu.cloud/images/${cartItems.values.toList()[index].imageUrl}',
                              cartItems.values.toList()[index].size,
                              cartItems.values.toList()[index].price,
                            );
                          },
                          onRemove: () {
                            cart.removeItem(
                                '${cartItems.values.toList()[index].id}');
                          },
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
                margin: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
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
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
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
                margin: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
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
                margin: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
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
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 0.8.sh,
                              width: 1.sw,
                              padding: EdgeInsets.all(15.r),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(9.r),
                                  topRight: Radius.circular(
                                    10.r,
                                  ),
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Gap(10.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Select a payment option',
                                          style: AppTextStyle.medium(
                                            color: AppColors.mainTextColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: SvgPicture.asset(
                                            'assets/svg/cancel.svg',
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10.h),
                                      padding: EdgeInsets.all(10.r),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 227, 227, 227),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/master.svg'),
                                          Gap(10.w),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '**** **** **** 1234',
                                                style: AppTextStyle.medium(
                                                    color:
                                                        AppColors.mainTextColor,
                                                    fontSize: 14),
                                              ),
                                              Text(
                                                '07/12',
                                                style: AppTextStyle.medium(
                                                    color:
                                                        AppColors.mainTextColor,
                                                    fontSize: 14),
                                              ),
                                              
                                            ],
                                          ),
                                          Expanded(child: SizedBox(),),
                                          SvgPicture.asset(
                                                  'assets/svg/breen.svg'),
                                        ],
                                      ),
                                    ),
                                    Gap(15.h),
                                    Text(
                                      'Full name',
                                      style: AppTextStyle.medium(
                                        color: AppColors.mainTextColor,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                    Gap(2.h),
                                    MyTextField(
                                      autocorrect: false,
                                      hintText: 'enter your full name',
                                      keyboardType: TextInputType.emailAddress,
                                      initialValue:
                                          '${user.firstname} ${user.lastname}',
                                      // controller: nameController,
                                      // onFieldSubmitted: (value) {
                                      //   FocusScope.of(context).requestFocus(emailFocusNode);
                                      // },
                                      onSaved: (newValue) =>
                                          initialValues['firstname'] =
                                              newValue.toString().trim(),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '* Required field';
                                        }
                                        return null;
                                      },
                                    ),
                                    Gap(15.h),
                                    Text(
                                      'email address',
                                      style: AppTextStyle.medium(
                                        color: AppColors.mainTextColor,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                    Gap(2.h),
                                    MyTextField(
                                      autocorrect: false,
                                      hintText: 'enter your email',
                                      initialValue: user.email,
                                      // obscureText: showPassword ? false : true,
                                      // focusNode: emailFocusNode,
                                      // onFieldSubmitted: (value) {
                                      //   FocusScope.of(context).requestFocus(passwordFocusNode);
                                      // },
                                      onSaved: (newValue) =>
                                          initialValues['email'] =
                                              newValue.toString().trim(),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '* Required field';
                                        }
                                        return null;
                                      },
                                    ),
                                    Gap(15.h),
                                    Text(
                                      'Phone number',
                                      style: AppTextStyle.medium(
                                        color: AppColors.mainTextColor,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                    Gap(2.h),
                                    MyTextField(
                                      autocorrect: false,
                                      hintText: 'enter your phone number',
                                      keyboardType: TextInputType.number,
                                      initialValue: user.number,
                                      // controller: nameController,
                                      // onFieldSubmitted: (value) {
                                      //   FocusScope.of(context).requestFocus(emailFocusNode);
                                      // },
                                      onSaved: (newValue) =>
                                          initialValues['number'] =
                                              newValue.toString().trim(),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '* Required field';
                                        }
                                        return null;
                                      },
                                    ),
                                    Gap(25.h),
                                    MainButton(
                                      child: Text('Proceed to payment'),
                                      onPressed: () {
                                        cart.clearCart();
                                        Navigator.pushNamed(context, SuccessScreen.routeName);
                                      },
                                      width: 1.sw,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      width: 0.25.sw,
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