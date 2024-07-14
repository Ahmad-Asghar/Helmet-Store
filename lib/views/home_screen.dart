import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helmets_store/common/widgets/app_text_widget.dart';
import 'package:helmets_store/views/helmet_details_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../common/app_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 6.h,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              spreadRadius: 5, // Spread radius
              blurRadius: 7, // Blur radius
              offset: const Offset(0, 3), // Offset in x and y direction
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 2.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.home_rounded,color: AppColors.codePadColor,size: 5.5.w,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_rounded,color: AppColors.greyTextColor,size: 5.5.w,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined,color: AppColors.greyTextColor,size: 5.5.w,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.settings_outlined,color: AppColors.greyTextColor,size: 5.5.w,))

            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 4.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w,right: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(title: "Home", fontWeight: FontWeight.w600, fontSize: 4.5.w),
                IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: AppColors.codePadColor,))
              ],
            ),
          ),
          SizedBox(
            height: 0.6.h,
          ),
          SizedBox(
            height: 4.7.h,
            width: double.infinity,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 5.w),
              scrollDirection: Axis.horizontal,
              itemCount: helmetTypes.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      selectedType.value = index;
                    },
                    child: Obx(() => AnimatedContainer(
                      curve: Curves.elasticInOut,
                      duration: const Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                        color: selectedType.value == index ? AppColors.codePadColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Center(
                          child: CustomTextWidget(
                            title: helmetTypes[index],
                            fontSize: 4.3.w,
                            color: selectedType.value == index ? AppColors.whiteColor : AppColors.blackColor,
                            fontWeight: selectedType.value == index ? FontWeight.w600 : FontWeight.w500,
                          ),
                        ),
                      ),
                    )),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          CarouselSlider.builder(
        itemCount: 10,
        options: CarouselOptions(
          padEnds: false,
          height: 30.h,
          enlargeCenterPage: false,
          viewportFraction: 0.73,
          initialPage: 0,
          enableInfiniteScroll: false,
          onPageChanged: (index, reason) {
            controller.onPageChanged(index);
          },
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HelmetDetailsScreen(index: index,)));
              },
              child: SizedBox(
                width: 70.w,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Row(
                      children: [
                        Hero(
                          tag: 'backContainer${9 - index}',
                          child: Container(
                            width: 55.w,
                            decoration: BoxDecoration(
                              gradient: AppColors.gradientColors[9 - index],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    title: helmetDetails.keys.elementAt(index),
                                    fontSize: 5.w,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.whiteColor,
                                  ),
                                  CustomTextWidget(
                                    title: '\$${helmetDetails.values.elementAt(index)}',
                                    fontSize: 4.2.w,
                                    color: AppColors.whiteColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15.w),
                      ],
                    ),
                    AnimatedBuilder(
                      animation: controller.animationController,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: controller.selectedIndex.value == index
                              ? controller.animation.value
                              : -135 * pi / 315,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Hero(
                              tag: 'image${10 - index}',
                              child: Image(
                                height: 160,
                                image: AssetImage('assets/images/png/${10 - index}.png'),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 CustomTextWidget(title: "Top Sell",fontSize: 5.w,),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     const Icon(Icons.keyboard_arrow_down_rounded),
                     CustomTextWidget(title: "This Week"),
                   ],
                 ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 3.w),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 0.w),
                  child: Card(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                      child: Row(
                        children: [
                          Image(
                            height: 60,
                            image: AssetImage('assets/images/png/${index + 1}.png'),
                          ),
                          SizedBox(width: 3.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomTextWidget(title:helmetDetails.keys.elementAt(index),fontWeight: FontWeight.w600,fontSize: 4.3.w,),
                              SizedBox(height: 0.5.h,),
                              CustomTextWidget(title:"Price: \$${helmetDetails.values.elementAt(index).toString()}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  final List<String> helmetTypes = [
    'All',
    'Smart',
    'Sports',
    'Regular',
    'Ski',
    'Football',
    'Construction',
    'Firefighter',
    'Equestrian',
  ];
  final RxInt selectedType = 0.obs;
}



final Map<String, int> helmetDetails = {
  'Super Racer 500': 200,
  'Aero Speedster X': 180,
  'Turbo Thruster 3000': 220,
  'Nitro Boost Elite': 250,
  'Velocity Titan': 190,
  'Stealth Hawk': 210,
  'Turbocharged X1': 230,
  'Hyper Rider Pro': 240,
  'Ultra Sonic Vortex': 270,
  'Apex Dominator': 260,
};






class HomeController extends GetxController with SingleGetTickerProviderMixin {
  RxInt selectedIndex = 0.obs;
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = Tween<double>(begin: -135 * pi / 315, end: 0).animate(animationController);
    // Trigger the initial animation for the first item
    animateInitialItem();
  }

  void animateInitialItem() {
    selectedIndex.value = 0;
    animationController.forward(from: 0);
  }

  void onPageChanged(int index) {
    if (selectedIndex.value != index) {
      selectedIndex.value = index;
      animationController.forward(from: 0);
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}

