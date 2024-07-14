import 'package:flutter/material.dart';
import 'package:helmets_store/views/home_screen.dart';
import 'package:helmets_store/views/order_detail_screen.dart';
import '../views/helmet_details_screen.dart';
import '../views/splash_screen.dart';

class Routes {

  static final Map<String, WidgetBuilder> routes = {

    '/': (context) =>     HomeScreen(),
    '/home': (context) =>     HomeScreen(),
    '/order_details': (context) =>     OrderDetailScreen(),

  };

}