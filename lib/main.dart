import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/login/splash.dart';
import 'package:fruit_hub_delivery_app/widgets/basket_page.dart';
import 'package:fruit_hub_delivery_app/widgets/home_screen_one.dart';
import 'package:fruit_hub_delivery_app/widgets/order_list.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fruit Hub Delivery App',
      home: SplashPage(),
    );
  }
}
