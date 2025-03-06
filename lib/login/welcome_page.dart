import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/login/aunthetication_page.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
        body: Column(
          children: [
        
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              color: AppColors.primarycolor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 200),
                       child: Image.asset(
                        'assets/images/fruit_drop.png', 
                        width: 40, 
                                           ),
                     ),         
                    Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: 
                      
                      Image.asset(
                        'assets/images/fruit_basket_home.png', 
                        height: 260,
                        width: 330, 
                      ),
                    ),
                    SizedBox(height: 6), 
                                 
                    Image.asset(
                      'assets/images/fruit_basket_shadow.png', 
                      width: 260, 
                    ),
                  ],
                ),
                ),
            ),),

           
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.only(top: 50,right: 15,left: 15),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get The Freshest Fruit Salad Combo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Text(
                        'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
                        style: TextStyle(fontSize: 13, color: Colors.black45,fontWeight: FontWeight.w600,),
                      ),
                    ),
                    SizedBox(height: 45),
                    Center(
                      child: SizedBox(
                        height: 50,
                         width: 320,
                        child: ElevatedButton(
                          onPressed: () {
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AuntheticationPage()));
                                          
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primarycolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                            ),
                          ),
                          child: Text(
                            "Let's Continue",
                            style: TextStyle(fontSize: 13, color: AppColors.secondarycolor,fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    
  }
}