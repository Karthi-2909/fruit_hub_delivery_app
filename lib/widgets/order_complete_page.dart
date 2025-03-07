import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';
import 'package:fruit_hub_delivery_app/widgets/home_screen_one.dart';
import 'package:fruit_hub_delivery_app/widgets/track_page.dart';



class OrderCompletePage extends StatefulWidget {
  const OrderCompletePage({super.key});

  @override
  State<OrderCompletePage> createState() => _OrderCompletePageState();
}

class _OrderCompletePageState extends State<OrderCompletePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.secondarycolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            
            Image.asset("assets/images/tick.png"),
            SizedBox(height: 30,),
            Text("Congratulations!!!", style: TextStyle(letterSpacing: 1.3,
              fontWeight: FontWeight.bold,fontSize: 22,color:Color(0xff29234b),
            ),),
            SizedBox(height: 20,),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color:Color(0xff29234b),
                ),
                children: [
                  TextSpan(text: "Your order have been taken and\n"),
                  TextSpan(text: "is being attended to")
                ],
              )
            ),
            SizedBox(height: 50,),
            SizedBox(
              height: 50,
              width: 120,
              child: ElevatedButton(onPressed: (){
                 Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TrackOrderPage()));
              }, 
              style: ElevatedButton.styleFrom(
                padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 14),
                backgroundColor: AppColors.primarycolor,
                foregroundColor: AppColors.secondarycolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              child: Text(
                "Track order",
                style: TextStyle(
                  fontSize: 14
                ),
              )),),
              SizedBox(height: 40),
              SizedBox(
                height: 50,
                width: 160,
                child: OutlinedButton(onPressed: (){
                   Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeRowPage()));
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.secondarycolor,
                  foregroundColor: AppColors.primarycolor,
                  side: BorderSide(color: AppColors.primarycolor,width: 1),
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(10),
                  ),
                ), child: Text("Continue shopping",
                style: TextStyle(
                  fontSize: 13
                ),)),
              )

            
          ],
        ),
      ),
    );
  }
}