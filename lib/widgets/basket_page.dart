import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  color: AppColors.primarycolor,
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("assets/images/quinoa_fruit_salad.png")
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 40.0,
                  left: 16.0,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      //shape: CircleBorder(),
                      padding: EdgeInsets.all(12),
                      backgroundColor: Colors.white, // Adjust color as needed
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                    label: Text(
                      "Go Back",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: AppColors.secondarycolor,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Quinoa Fruit Salad",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("One Pack Contains:", style: TextStyle(
                      fontSize: 23,color: Colors.black,
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(text: "Red Quinoa, Lime, Honey, Blueberries, Strawberries,"),
                          TextSpan(text: "Mango, Fresh mint.")
                        ]
                      ),
                           ),
                  ),
                         Divider(),
                         Padding(
                           padding: const EdgeInsets.all(10),
                           child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(text: "If you are looking for a new fruit salad to eat today,"),
                                TextSpan(text: "quinoa is the perfect brunch for you. make")
                              ]
                            )
                            ),
                         ),
                         Row(
                          children: [
                        //     IconButton(
                        //       icon: Icon(
                        //   isFavorite ? Icons.favorite : Icons.favorite_border,
                        //   color: isFavorite ? Colors.red : Colors.black,
                        // ),onPressed: onPressed, icon: icon)
                            
                          ],
                         )
                         
              
                ],
              ),
              
            ),
          ),
        ],
      ),
    );
  }
}
