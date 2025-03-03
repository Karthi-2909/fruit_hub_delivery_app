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
            Text("Congratulations!!!", style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black,
            ),),
            SizedBox(height: 20,),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: "Your order has been taken and\n\n"),
                  TextSpan(text: "is being attended to")
                ],
              )
            ),
            SizedBox(height: 40,),
            SizedBox(
              height: 60,
              width: 200,
              child: ElevatedButton(onPressed: (){
                 Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TrackOrderPage()));
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primarycolor,
                foregroundColor: AppColors.secondarycolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              child: Text(
                "Track order",
                style: TextStyle(
                  fontSize: 18
                ),
              )),),
              SizedBox(height: 40),
              SizedBox(
                height: 60,
                width: 300,
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
                  side: BorderSide(color: AppColors.primarycolor,width: 2),
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(10),
                  ),
                ), child: Text("Continue shopping",
                style: TextStyle(
                  fontSize: 18
                ),)),
              )

            
          ],
        ),
      ),
    );
  }
}