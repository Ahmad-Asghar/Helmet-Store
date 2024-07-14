import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helmets_store/common/app_colors.dart';
import 'package:helmets_store/common/widgets/app_text_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'home_screen.dart';


class HelmetDetailsScreen extends StatelessWidget {
   int? index;
   HelmetDetailsScreen({super.key,  this.index});
   RxInt count=1.obs;
   UniqueKey key1=UniqueKey();
   UniqueKey key2=UniqueKey();

   final RxInt selectedSize = 1.obs;
  @override
  Widget build(BuildContext context) {
    final switchController = Get.put(WidgetSwitchController());
    final int? receivedIndex = index;
    print("Received Index $receivedIndex");
    return Scaffold(
      bottomNavigationBar: Obx(() => switchController.showFirst.value == true
          ? MaterialButton(
        height: 7.h,
        minWidth: 0,
        color: AppColors.blackColor,
        onPressed: () {
          switchController.toggleWidgets();
        },
        child: CustomTextWidget(
          title: 'Buy Now',
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600,
          fontSize: 4.7.w,
        ),
      ):const SizedBox(),
      ),
      body: Column(
        children: [
          Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Hero(
                  tag: 'backContainer${9 - (receivedIndex!)}',
                  child: Container(
                    height: 30.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: AppColors.gradientColors[9-receivedIndex],
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(300))
                    ),
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
                              icon:Icon(Icons.chevron_left_rounded,color: AppColors.whiteColor,size: 9.w,),
                            ),
                            CustomTextWidget(title: "Helmet Details",color: AppColors.whiteColor,fontSize: 5.w,fontWeight: FontWeight.w600,),
                            SizedBox(width: 10.w,)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
              ],
            ),
            Hero(
              tag:'image${10 - (receivedIndex)}',
              child: Image(
                height: 200,
                image: AssetImage('assets/images/png/${10 - (receivedIndex)}.png'),
              ),
            ),
          ],
        ),
          SizedBox(
            height: 2.h,
          ),
          GetBuilder<WidgetSwitchController>(
            builder: (controller) => AnimatedSwitcher(
              duration: const Duration(milliseconds: 1200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                // For the first widget (slide left to right)
                if (controller.showFirst.value) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1.0, 0.0), // Slide from left
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                } else {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                }
              },
              child: controller.showFirst.value
                  ? Padding(
                key: key1,
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          title: helmetDetails.keys.elementAt(receivedIndex),
                          fontSize: 4.6.w,
                          fontWeight: FontWeight.w600,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (count.value != 0) {
                                  count.value--;
                                }
                              },
                              icon: Icon(Icons.remove, size: 5.w),
                            ),
                            Obx(
                                  () => AnimatedFlipCounter(
                                textStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600, fontSize: 4.2.w),
                                duration: const Duration(milliseconds: 500),
                                value: count.value,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                count.value++;
                              },
                              icon: Icon(Icons.add, size: 5.w),
                            ),
                          ],
                        ),
                        Obx(
                              () => Row(
                            children: [
                               CustomTextWidget(title: '\$'),
                              AnimatedFlipCounter(
                                textStyle: GoogleFonts.poppins(fontSize: 4.2.w),
                                duration: const Duration(milliseconds: 500),
                                value: (helmetDetails.values.elementAt(receivedIndex) *
                                    count.value),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                     CustomTextWidget(
                      title: 'Size',
                      fontSize: 4.6.w,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 5.h,
                      child: Row(
                        children: List.generate(
                          4,
                              (index) => CustomSizeSelector(
                            index: index,
                            receivedIndex: receivedIndex,
                            selectedSize: selectedSize,
                          ),
                        ),
                      ),
                    ),
                     CustomTextWidget(
                      title: 'Advance Feature',
                      fontSize: 4.6.w,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 0.5.h),
                    const FeatureRow(title: 'GPS System'),
                    const FeatureRow(title: 'Air Passing System'),
                    const FeatureRow(title: 'Bluetooth Connectivity'),
                    const FeatureRow(title: 'Washable'),
                     CustomTextWidget(
                      title: 'Product Reviews(10)',
                      fontSize: 4.6.w,
                      fontWeight: FontWeight.w600,
                    ),
                    const CustomReviewWidget(reviewText: 'Comfortable fit, great for long rides.',hoursBefore: 1,),
                    const CustomReviewWidget(reviewText: 'Durable build, sleek and stylish design.',hoursBefore: 2,),
                    const CustomReviewWidget(reviewText: 'Easy to adjust, secure and snug.',hoursBefore: 3,),
                  ],
                ),
              )
                  : Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      key: key2,
                      children: [
                        SizedBox(height: 18.5.h,),
                        Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            color: AppColors.blackColor,
                            height: 6.5.h,
                            onPressed: (){
                              _showAnimatedDialog(context);
                            },
                            child: CustomTextWidget(title: 'Cash on Delivery',color: AppColors.whiteColor,fontWeight: FontWeight.w600,fontSize: 4.2.w,),
                          ),
                        ),
                      ],
                    ),
                        SizedBox(height: 2.h,),
                        Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                color: AppColors.blackColor,
                                height: 6.5.h,
                                onPressed: (){},
                                child: CustomTextWidget(title: 'Mobile Banking',color: AppColors.whiteColor,fontWeight: FontWeight.w600,fontSize: 4.2.w,),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                color: AppColors.blackColor,
                                height: 6.5.h,
                                onPressed: (){},
                                child: CustomTextWidget(title: 'Pay by Card',color: AppColors.whiteColor,fontWeight: FontWeight.w600,fontSize: 4.2.w,),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                color: AppColors.blackColor,
                                height: 6.5.h,
                                onPressed: (){
                                  switchController.toggleWidgets();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.arrow_back_rounded,color: AppColors.whiteColor,size: 6.w,),
                                    SizedBox(width: 5.w,),
                                    CustomTextWidget(title: 'Edit Details',color: AppColors.whiteColor,fontWeight: FontWeight.w600,fontSize: 4.2.w,),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                                    ],
                                  ),
                  ),
            ),
          ),

        ],
      ),
    );
  }

   void _showAnimatedDialog(BuildContext context) {
     showGeneralDialog(
       context: context,
       barrierDismissible: true,
       barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
       barrierColor: Colors.black54,
       transitionDuration: const Duration(milliseconds: 400),
       pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
         return Center(
           child: Hero(
             tag: 'dialog',
             child: Container(
               width: MediaQuery.of(context).size.width * 0.8,
               height: 195,
               color: Colors.white,
               child: Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 5.w),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     SizedBox(
                      height:80,
                      child: Lottie.asset('assets/images/svg/checked.json',repeat: false)
                  ),
                     CustomTextWidget(title: 'Order Confirmed!',fontSize: 5.2.w,fontWeight: FontWeight.w600),
                     RichText(
                       textAlign: TextAlign.center,
                       text: TextSpan(
                         style: GoogleFonts.poppins(
                           fontSize: 3.9.w,
                           color: Colors.black,
                         ),
                         children: [
                           const TextSpan(text: 'Your order is placed successfully!\nPlease, check your '),
                           TextSpan(
                             text: 'order history',
                             style: GoogleFonts.poppins(
                               decoration: TextDecoration.underline,
                               fontSize: 4.1.w,
                               fontWeight: FontWeight.bold,
                               color: Colors.black,
                             ),
                             recognizer: TapGestureRecognizer()
                               ..onTap = () {
                               Navigator.pushNamed(context, '/order_details',arguments: index);

                               },
                           ),
                           const TextSpan(text: '.\nGet your delivery in 24 hours.'),
                         ],
                       ),
                     )
                   ],
                 ),
               ),
             ),
           ),
         );
       },
       transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
         return SlideTransition(
           position: Tween<Offset>(
             begin: const Offset(-1.0, 0.0),
             end: Offset.zero,
           ).animate(animation),
           child: child,
         );
       },
     );
   }

}


class WidgetSwitchController extends GetxController {
  var showFirst = true.obs;

  void toggleWidgets() {
    showFirst.value = !showFirst.value;
    update();
  }
}



class CustomSizeSelector extends StatelessWidget {
  final int index;
  final int receivedIndex;
  final RxInt selectedSize;

  CustomSizeSelector({
    Key? key,
    required this.index,
    required this.receivedIndex,
    required this.selectedSize,
  }) : super(key: key);

  final List<String> sizes = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        selectedSize.value = index;
      },
      icon: Obx(() => CustomTextWidget(
        title: sizes[index],
        fontSize: 4.7.w,
        fontWeight: selectedSize.value == index ? FontWeight.bold : FontWeight.w400,
        color: selectedSize.value == index
            ? AppColors.gradientColors[9 - receivedIndex].colors[0]
            : Colors.black,
      )),
    );
  }
}

class FeatureRow extends StatelessWidget {
  final String title;

  const FeatureRow({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 5.w),
         CircleAvatar(
          radius: 3,
          backgroundColor: AppColors.codePadColor,
        ),
        SizedBox(width: 3.w),
        CustomTextWidget(
          title: title,
          fontSize: 4.3.w,
        ),
      ],
    );
  }
}

class CustomReviewWidget extends StatelessWidget {

  final String reviewText;
  final int hoursBefore;
  const CustomReviewWidget({super.key, required this.reviewText, required this.hoursBefore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.3.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 4.5.w,
            backgroundImage:
            const AssetImage('assets/images/png/user.jpg'),
          ),
          SizedBox(width: 3.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 0.7),
                child: CustomTextWidget(
                  title: reviewText,
                  fontSize: 3.7.w,
                ),
              ),
              SizedBox(height: 0.5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingStars(
                    valueLabelVisibility: false,
                    axis: Axis.horizontal,
                    value: 4.3,
                    onValueChanged: (v) {},
                    starCount: 5,
                    starSize: 12,
                    maxValue: 5,
                    starSpacing: 2,
                    animationDuration:
                    const Duration(milliseconds: 1000),
                    starOffColor: Colors.yellow,
                    starColor: Colors.yellow,
                    angle: 12,
                  ),
                  SizedBox(width: 5.w),
                  CustomTextWidget(
                    title: "${hoursBefore.toString()} hours ago",
                    fontSize: 3.4.w,
                    color: AppColors.greyTextColor,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
