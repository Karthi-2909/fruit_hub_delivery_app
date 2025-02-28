import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  bool isFavorite = false;
  int quantity = 1;
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
                  top: 30.0,
                  left: 10.0,
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
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Quinoa Fruit Salad",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(

                              style: IconButton.styleFrom(
                                shape: CircleBorder(
                                  side: BorderSide(width: 1),
                                  
                                ),
                                
                              ),
                              icon: Icon(
                                Icons.remove,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              },
                            ),
                            SizedBox(width: 5),
                            Text(
                              quantity.toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5,),
                            CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 250, 226, 204),
                              child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: AppColors.primarycolor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 120,),
                            Text('\u20A6  2,000', //nigeria currency symbol code
                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,)
                            
                            )
                                ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "One Pack Contains:",
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primarycolor,
                                decorationThickness: 2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                        text:
                                            "Red Quinoa, Lime, Honey, Blueberries, \n"),
                                    TextSpan(text: "Strawberries, Mango, Fresh mint.")
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                  text:
                                      "If you are looking for a new fruit salad to eat today,"),
                              TextSpan(
                                  text:
                                      " quinoa is the perfect brunch for you. make")
                            ])),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 250, 226, 204),
                        child: IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite
                                ? AppColors.primarycolor
                                : AppColors.primarycolor,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primarycolor,
                                foregroundColor: AppColors.secondarycolor,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {},
                            child: Text(
                              "Add to basket",
                              style: TextStyle(fontSize: 18),
                            )),
                      )
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
