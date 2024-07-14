import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stage_one/app/constants/app_colors.dart';
import 'package:stage_one/app/constants/app_text_style.dart';
import 'package:stage_one/app/constants/main_button.dart';
import 'package:stage_one/app/constants/shared.dart';
import 'package:stage_one/app/screens/home_screen.dart';
import 'package:stage_one/app/screens/welcome_screen.dart';
import 'package:stage_one/providers/product_providers.dart';
import 'package:stage_one/app/screens/product_screen.dart';
import 'package:stage_one/providers/user_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool failedReqest = false;
  bool isLoading = false;
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () async {
        bool seenIntro = await Shared.getSeenIntro() ?? false;
        if (seenIntro) {
          final result =
              await ref.read(productsProvider.notifier).fetchProduct();
          await ref.read(userProvider.notifier).setUserDetails();
          if (result) {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          } else {
            setState(() {
              failedReqest = true;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'An error occured. Please check your internet and try again',
                ),
              ),
            );
          }
        } else {
          await Shared.setSeenIntro(true);
          Navigator.of(context).pushReplacementNamed(
            WelcomeScreen.routeName,
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Shop App',
                        style: AppTextStyle.bold(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    if (failedReqest)
                      MainButton(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primaryColor,
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          final result = await ref
                              .read(productsProvider.notifier)
                              .fetchProduct();
                          setState(() {
                            isLoading = false;
                          });
                          if (result) {
                            setState(() {
                              failedReqest = false;
                            });
                            Navigator.of(context)
                                .pushReplacementNamed(HomeScreen.routeName);
                          } else {
                            ScaffoldMessenger.of(context).removeCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'An error occured. Please check your internet and try again',
                                ),
                              ),
                            );
                          }
                        },
                        width: 0.5.sw,
                        child: isLoading
                            ? const CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            )
                            : Text(
                                'Try Again',
                              ),
                      )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
