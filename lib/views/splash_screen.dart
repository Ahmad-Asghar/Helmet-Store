import 'dart:async';
import 'package:flutter/material.dart';
import '../common/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 4),
          () {
        Navigator.of(context).pushReplacementNamed('/home');
      },
    );
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Image(
            height:150,
            width:150,
            image: AssetImage('assets/images/png/logo.png'),
            color: AppColors.codePadColor,

          ),
        ),
      ),
    );
  }
}
