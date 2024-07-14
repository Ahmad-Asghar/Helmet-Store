import 'package:flutter/material.dart';
import 'package:helmets_store/views/helmet_details_screen.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../common/app_colors.dart';
import '../common/widgets/app_text_widget.dart';
import 'home_screen.dart';
import 'package:get/get.dart';

class OrderDetailScreen extends StatelessWidget {
  int? index;
   OrderDetailScreen({super.key,this.index});

  @override
  Widget build(BuildContext context) {
    HelmetDetailsScreen controller=HelmetDetailsScreen(index: 0,);
    final int? receivedIndex = ModalRoute.of(context)?.settings.arguments as int?;
    print("Received Index $receivedIndex");
    return Scaffold(
      body: Hero(
        tag: 'dialog',
        child:Container(
            color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 3.5.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon:Icon(Icons.chevron_left_rounded,size: 9.w,),
                  ),
                  CustomTextWidget(title: "Present Order",fontSize: 5.w,fontWeight: FontWeight.w600,),
                  SizedBox(width: 10.w,)
                ],
              ),
              SizedBox(height: 1.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    GetBuilder<SlideAnimationController>(
                      builder: (animationController) {
                        return SlideTransition(
                          position: animationController.offsetAnimation,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 13.h,
                                width: 30.w,
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 25.w,
                                          decoration: BoxDecoration(
                                            gradient: AppColors.gradientColors[9 - receivedIndex!],
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                        ),
                                        SizedBox(width: 5.w),
                                      ],
                                    ),
                                    Image(
                                      height: 70,
                                      image: AssetImage('assets/images/png/${10 - receivedIndex}.png'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    title: 'Order No#: 347786',
                                    color: AppColors.greyTextColor,
                                    fontSize: 3.8.w,
                                  ),
                                  SizedBox(height: 0.1.h),
                                  Obx(
                                        () => CustomTextWidget(
                                      title:
                                      'Cash on Delivery \$${controller.count.value * helmetDetails.values.elementAt(receivedIndex)}',
                                      color: AppColors.greyTextColor,
                                      fontSize: 3.8.w,
                                    ),
                                  ),
                                  SizedBox(height: 0.3.h),
                                  CustomTextWidget(
                                    title: helmetDetails.keys.elementAt(receivedIndex),
                                    fontSize: 4.2.w,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(height: 0.1.h),
                                  CustomTextWidget(
                                    title: "Helmet Size 'L'",
                                    fontSize: 4.2.w,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 1.3.h,),
                    Divider(color: AppColors.greyTextColor.withOpacity(0.4)),
                    SizedBox(height: 3.h,),
                    GetBuilder<SlideAnimationController>(
                        builder: (animationController) {
                          return SlideTransition(
                            position: animationController.offsetAnimation2,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 40.h,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    VerticalDivider(
                                      color: AppColors.codePadColor,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircleAvatar(
                                          radius: 4.3.w,
                                          backgroundColor: AppColors.codePadColor,
                                          child: Center(child: Icon(Icons.shopping_cart,color: AppColors.whiteColor,size: 5.w,)),
                                        ),

                                        CircleAvatar(
                                          radius: 4.3.w,
                                          backgroundColor: AppColors.codePadColor,
                                          child: CircleAvatar(
                                            radius: 4.3.w,
                                            backgroundColor: AppColors.whiteColor.withOpacity(0.5),
                                            child: Center(child: Icon(Icons.sticky_note_2_rounded,color: AppColors.whiteColor,size: 5.w,)),

                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: 4.3.w,
                                          backgroundColor: AppColors.codePadColor,
                                          child: CircleAvatar(
                                            radius: 4.3.w,
                                            backgroundColor: AppColors.whiteColor.withOpacity(0.5),
                                            child: Center(child: Icon(Icons.fire_truck_rounded,color: AppColors.whiteColor,size: 5.w,)),

                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: 4.3.w,
                                          backgroundColor: AppColors.codePadColor,
                                          child: CircleAvatar(
                                            radius: 4.3.w,
                                            backgroundColor: AppColors.whiteColor.withOpacity(0.5),
                                            child: Center(child: Icon(Icons.thumb_up,color: AppColors.whiteColor,size: 5.w,)),

                                          ),
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 5.w,),
                              SizedBox(height: 40.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(title: "Order Placed",fontWeight: FontWeight.w600,),
                                      CustomTextWidget(
                                        title: DateFormat('d MMMM yyyy h:mm a').format(DateTime.now()),
                                        color: AppColors.greyTextColor,
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(title: "Order Confirmed",fontWeight: FontWeight.w600,),
                                      CustomTextWidget(
                                        title: "Expected at : ${DateFormat('d MMMM yyyy h:mm a').format(DateTime.now().add(const Duration(days: 1)))}",
                                        color: AppColors.greyTextColor,
                                      )                              ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(title: "Order in transit",fontWeight: FontWeight.w600,),
                                      CustomTextWidget(
                                        title: "Expected at : ${DateFormat('d MMMM yyyy h:mm a').format(DateTime.now().add(const Duration(days: 3)))}",
                                        color: AppColors.greyTextColor,
                                      )                              ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(title: "Delivered Successfully",fontWeight: FontWeight.w600,),
                                      CustomTextWidget(
                                        title: "Expected at : ${DateFormat('d MMMM yyyy h:mm a').format(DateTime.now().add(const Duration(days: 5)))}",
                                        color: AppColors.greyTextColor,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              ),
                            ],
                          ),
                        );
                      }
                    ),
                    SizedBox(height: 5.h,),
                    Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            color: AppColors.blackColor,
                            height: 6.5.h,
                            onPressed: (){
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.home_rounded,color: AppColors.whiteColor,size: 6.w,),
                                SizedBox(width: 5.w,),
                                CustomTextWidget(title: 'Back to Home',color: AppColors.whiteColor,fontWeight: FontWeight.w600,fontSize: 4.2.w,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              )
            ],
          ),
    )
    ),
    );
  }
}




class SlideAnimationController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<Offset> offsetAnimation;
  late AnimationController animationController2;
  late Animation<Offset> offsetAnimation2;


  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    )..forward();

    animationController2 = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    )..forward();

    offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    offsetAnimation2 = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController2,
      curve: Curves.easeInOut,
    ));

  }

  @override
  void onClose() {
    animationController.dispose();
    animationController2.dispose();
    super.onClose();
  }
}