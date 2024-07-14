import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'common/app_colors.dart';
import 'common/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return ResponsiveSizer(builder: (context, orientation, screenType) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor:Colors.transparent));
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Helmii',
        initialRoute: '/',
        routes: Routes.routes,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
        ),
      );
    });
  }
}







