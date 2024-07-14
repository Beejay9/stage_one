import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stage_one/app/constants/app_colors.dart';
import 'package:stage_one/app/constants/app_text_style.dart';
import 'package:stage_one/app/constants/main_button.dart';
import 'package:stage_one/app/widget/homescreen_item.dart';
import 'package:stage_one/app/widget/logo_item.dart';
import 'package:stage_one/providers/product_providers.dart';
import 'package:stage_one/providers/user_provider.dart';

class ProductScreen extends ConsumerWidget {
  ProductScreen({super.key});
  static const routeName = '/productScreen';

  // final brandSvg = [];

  final brands = [
    {'name': 'Nike', 'svg': 'assets/svg/nike.svg'},
    {
      'name': 'Gucci',
      'svg': 'assets/svg/gucci.svg',
    },
    {
      'name': 'jordan',
      'svg': 'assets/svg/jordan.svg',
    },
    {
      'name': 'Balenciaga',
      'svg': 'assets/svg/balenciaga.svg',
    },
    {
      'name': 'Adidas',
      'svg': 'assets/svg/adidas.svg',
    },
    {
      'name': 'Reebok',
      'svg': 'assets/svg/reebok.svg',
    },
    {
      'name': 'New Balance',
      'svg': 'assets/svg/NB.svg',
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final products = ref.read(productsProvider.notifier).products;
    final user = ref.read(userProvider.notifier);
    // final products = ref.read(productProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Products',
          style: AppTextStyle.bold(
            color: AppColors.mainTextColor,
            fontSize: 24.sp,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: SvgPicture.asset('assets/svg/search-01.svg'),
          )
        ],
        backgroundColor: Colors.white,
        foregroundColor: AppColors.mainTextColor,
      ),
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        // color: Colors.white,
        // child: ref.read(productProvider)
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.amber[700],
                    child: Text(
                        '${user.firstname.characters.first}${user.lastname.characters.first}'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Good afternoon',
                          style: AppTextStyle.regular(
                            color: AppColors.subTextColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${user.firstname} ${user.lastname}',
                      style: AppTextStyle.medium(
                        color: AppColors.mainTextColor,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 0.27.sh,
              width: 1.sw,
              child: Swiper(
                itemCount: 4,
                indicatorLayout: PageIndicatorLayout.SCALE,
                scrollDirection: Axis.horizontal,
                allowImplicitScrolling: true,

                pagination: SwiperPagination(
                  builder: const DotSwiperPaginationBuilder(
                    activeColor: Colors.white,
                    color: AppColors.subTextColor,
                    size: 12,
                    activeSize: 10,
                  ),
                  margin: EdgeInsets.only(
                    bottom: 25.h,
                  ),
                ),

                itemBuilder: (context, index) {
                  final colors = [
                    [Color(0xff0072C6), Color(0xff003760)],
                    [Color(0xff292929), Color(0xff333333)],
                    [Color(0xff003760), Color(0xff1D2939)],
                    [Color(0xffFFA500), Color(0xffFFCD00)],
                  ];
                  final listFeaturedList = [
                    products[0],
                    products[9],
                    products[1],
                    products[8],
                  ];
                  return FeaturedItem(
                    id: '${listFeaturedList[index]['id']}',
                    name: '${listFeaturedList[index]['name']}',
                    colors: colors[index],
                    category:
                        '${listFeaturedList[index]['categories'][0]['name'].toString().capitalize}',
                    price: listFeaturedList[index]['current_price']?[0]['NGN']
                        [0] as double,
                        textColor: index > 2 ? AppColors.descriptionColor : null,
                    imageUrl:
                        '${listFeaturedList[index]['photos'][0]['url'] ?? ''}',
                  );
                },
                // child: FeaturedItem(
                //   id: '${products[0]['id']}',
                //   name: '${products[0]['name']}',
                //   category: '${products[0]['categories'][0]['name'].toString().capitalize}' ,
                //   price: products[0]['current_price']?[0]['NGN'][0] as double,
                //   imageUrl: '${products[0]['photos'][0]['url'] ?? ''}',
                // ),
              ),
            ),
            Gap(15.h),
            Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.spaceBetween,
              spacing: 15,
              children: brands
                  .map(
                    (e) => LogoItem(
                      svg: e['svg'],
                      brand: '${e['name']}',
                    ),
                  )
                  .toList(),
            ),
            Gap(10),
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                left: 15.w,
                bottom: 10.h,
              ),
              child: Text(
                'Our Special Offers',
                style: AppTextStyle.bold(
                  color: AppColors.mainTextColor,
                  fontSize: 24.sp,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: HomeScreenItem(
                    id: '${products[0]['id']}',
                    name: '${products[0]['name']}',
                    imageUrl: '${products[0]['photos'][0]['url']}',
                    category:
                        '${products[0]['categories'][0]['name'].toString().capitalize.toString().capitalize}',
                    price: products[0]['current_price']?[0]['NGN'][0] as double,
                    rating: 5.0,
                    unitSold: 200,
                  ),
                ),
                HomeScreenItem(
                  id: '${products[1]['id']}',
                  name: '${products[1]['name']}',
                  imageUrl: '${products[1]['photos'][0]['url']}',
                  category:
                      '${products[1]['categories'][0]['name'].toString().capitalize.toString().capitalize.toString().capitalize}',
                  price: products[1]['current_price']?[0]['NGN'][0] as double,
                  rating: 5.0,
                  unitSold: 200,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeScreenItem(
                  id: '${products[2]['id']}',
                  name: '${products[2]['name']}',
                  imageUrl: '${products[2]['photos'][0]['url']}',
                  category:
                      '${products[2]['categories'][0]['name'].toString().capitalize.toString().capitalize.toString().capitalize.toString().capitalize}',
                  price: products[2]['current_price']?[0]['NGN'][0] as double,
                  rating: 5.0,
                  unitSold: 200,
                ),
                HomeScreenItem(
                  id: '${products[3]['id']}',
                  name: '${products[3]['name']}',
                  imageUrl: '${products[3]['photos'][0]['url']}',
                  category:
                      '${products[3]['categories'][0]['name'].toString().capitalize.toString().capitalize.toString().capitalize.toString().capitalize.toString().capitalize}',
                  price: products[3]['current_price']?[0]['NGN'][0] as double,
                  rating: 5.0,
                  unitSold: 200,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                left: 15.w,
                bottom: 10.h,
              ),
              child: Text(
                'Featured Sneakers',
                style: AppTextStyle.bold(
                    color: AppColors.mainTextColor, fontSize: 24.sp),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeScreenItem(
                  id: '${products[4]['id']}',
                  name: '${products[4]['name']}',
                  imageUrl: '${products[4]['photos'][0]['url']}',
                  category:
                      '${products[4]['categories'][0]['name'].toString().capitalize.toString().capitalize.toString().capitalize.toString().capitalize.toString().capitalize.toString().capitalize}',
                  price: products[4]['current_price']?[0]['NGN'][0] as double,
                  rating: 5.0,
                  unitSold: 200,
                ),
                HomeScreenItem(
                  id: '${products[9]['id']}',
                  name: '${products[9]['name']}',
                  imageUrl: '${products[9]['photos'][0]['url']}',
                  category:
                      '${products[9]['categories'][0]['name'].toString().capitalize}',
                  price: products[9]['current_price']?[0]['NGN'][0] as double,
                  rating: 5.0,
                  unitSold: 200,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeScreenItem(
                  id: '${products[8]['id']}',
                  name: '${products[8]['name']}',
                  imageUrl: '${products[8]['photos'][0]['url']}',
                  category:
                      '${products[8]['categories'][0]['name'].toString().capitalize}',
                  price: products[8]['current_price']?[0]['NGN'][0] as double,
                  rating: 5.0,
                  unitSold: 200,
                ),
                HomeScreenItem(
                  id: '${products[7]['id']}',
                  name: '${products[7]['name']}',
                  imageUrl: '${products[7]['photos'][0]['url']}',
                  category:
                      '${products[7]['categories'][0]['name'].toString().capitalize}',
                  price: products[7]['current_price']?[0]['NGN'][0] as double,
                  rating: 5.0,
                  unitSold: 200,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeScreenItem(
                  id: '${products[5]['id']}',
                  name: '${products[5]['name']}',
                  imageUrl: '${products[5]['photos'][0]['url']}',
                  category:
                      '${products[5]['categories'][0]['name'].toString().capitalize}',
                  price: products[5]['current_price']?[0]['NGN'][0] as double,
                  rating: 5.0,
                  unitSold: 200,
                ),
                HomeScreenItem(
                  id: '${products[6]['id']}',
                  name: '${products[6]['name']}',
                  imageUrl: '${products[6]['photos'][0]['url']}',
                  category:
                      '${products[6]['categories'][0]['name'].toString().capitalize}',
                  price: products[6]['current_price']?[0]['NGN'][0] as double,
                  rating: 5.0,
                  unitSold: 200,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 100.w,
              ),
              child: MainButton(
                child: Text(
                  'View more',
                  style: AppTextStyle.medium(color: Colors.white),
                ),
                onPressed: () {},
                width: 200,
              ),
            ),
            // Wrap(
            //   alignment: WrapAlignment.start,
            //   spacing: 10,
            //   children: products.map((product) {
            //     return HomeScreenItem(
            //       name: '${product['name']}',
            //       imageUrl: '${product['photos'][0]['url']}',
            //       category: 'Shoes',
            //       price: product['current_price']?[0]['NGN'][0] as double,
            //       rating: 5.0,
            //       unitSold: 200,

            //     );
            //   }).toList(),
            //   // physics: NeverScrollableScrollPhysics(),
            //   // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //   //     crossAxisCount: 2, mainAxisExtent: 300.h),
            //   // itemCount: products.length,
            //   // itemBuilder: (context, index) {
            //   //   if (products.isEmpty || products == null) {
            //   //     return Center(
            //   //       child: Text('No products found'),
            //   //     );
            //   //   }

            //   //   if (ref.read(productsProvider.notifier).isLoading) {
            //   //     return SizedBox(
            //   //       height: 10,
            //   //       width: 10,
            //   //       child: CircularProgressIndicator(),
            //   //     );
            //   //   }
            //   //   // return
            //   // }
            // ),
          ],
        ),
        //     }),
      ),
    );
  }
}
