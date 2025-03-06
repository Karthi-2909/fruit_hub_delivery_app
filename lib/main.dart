import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/login/splash.dart';



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
      title: 'Fruit Hub',
      home: SplashPage(),
    );
  }
}
