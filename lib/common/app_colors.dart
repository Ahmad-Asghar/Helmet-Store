import 'package:flutter/material.dart';

class AppColors {

  //static Color primaryColor = const Color(0xff5594f2);
  static Color primaryColor = const Color(0xff66c6d4);
  //static Color secondaryColor = const Color(0xffd3e4fe);
  static Color secondaryColor = const Color(0xffbcf8fa);
  static Color dividerColor = const Color(0xfff3f4f9);
  static Color greyTextColor = const Color(0xff66749f);
  static Color codePadColor = const Color(0xff1f294a);



  static Color  blackColor= Colors.black;
  static Color  whiteColor= Colors.white;



  static List<LinearGradient> gradientColors = [
    LinearGradient(
      colors: [ Colors.red,Colors.grey.shade400],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    LinearGradient(
      colors: [Colors.black, Colors.grey.shade400],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    LinearGradient(
      colors: [ Color(0xfffd6820),Colors.grey.shade400,],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    LinearGradient(
      colors: [Colors.red,Color(0xffd5dee7)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    LinearGradient(
      colors: [Color(0xff330e0e),Color(0xff9f9da2), ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    LinearGradient(
      colors: [Color(0xff04a5ef), Colors.grey.shade700],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    LinearGradient(
      colors: [Colors.lightGreen,Colors.grey.shade900, ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    LinearGradient(
      colors: [Color(0xff86fbf1),Colors.grey.shade900, ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    LinearGradient(
      colors: [Color(0xffa58756), Colors.grey.shade900],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    LinearGradient(
      colors: [Color(0xffb3ce33),Colors.grey.shade900, ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ];

}