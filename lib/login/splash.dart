import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_hub_delivery_app/login/welcome_page.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), (){
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WelcomePage())

      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondarycolor,
      child: Center(
        child: Image.asset(
          "assets/images/fruit_hub_logo.png"
        ),
      ),
    );
  }
}