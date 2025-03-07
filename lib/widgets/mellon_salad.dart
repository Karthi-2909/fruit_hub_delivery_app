import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';
import 'package:fruit_hub_delivery_app/widgets/home_screen_one.dart';
import 'package:fruit_hub_delivery_app/widgets/order_list.dart';

class MellonPage extends StatefulWidget {
  const MellonPage({super.key});

  @override
  State<MellonPage> createState() => _MellonPageState();
}

class _MellonPageState extends State<MellonPage> {
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
                        Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: Image.asset(
                              "assets/images/Glowing_Berry_Fruit_Salad.png",),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 30.0,
                  left: 10.0,
                  child: SizedBox(
                    height: 35,
                    width: 85,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                     
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>HomeRowPage()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize
                            .min, // Ensures the button wraps content
                        children: [
                          Icon(Icons.arrow_back_ios_new_outlined,
                              color: Colors.black, size: 15),
                        
                          Text(
                            "Go back",
                            style: TextStyle(color: Colors.black,fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.secondarycolor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primarycolor,
                    spreadRadius: 10,
                    blurRadius: 0,
                    offset: Offset(0, -5),
                    // Adds shadow effect
                  ),
                ],
              ),
              //color: AppColors.secondarycolor,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Mellon Fruit Salad",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Color.fromARGB(255, 43, 41, 55),
                                 
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: IconButton(
                                    style: IconButton.styleFrom(
                                     
                                      shape: CircleBorder(
                                        side: BorderSide(width: 1),
                                      ),
                                    ),
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.black,size: 16,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (quantity > 1) quantity--;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(width: 14),
                                Text(
                                  quantity.toString(),
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                                CircleAvatar(
                                 radius: 16,
                                  backgroundColor:
                                      Color.fromARGB(255, 250, 226, 204),
                                  child: IconButton(
                                    
                                    icon: Icon(
                                      Icons.add_outlined,size: 18,
                                      color: AppColors.primarycolor,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 132,
                                ),
                                Text('\u20A6 2,000', //nigeria currency symbol code
                                    style: TextStyle(
                                      letterSpacing: 1.3,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color(0xff312d43)
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 0.15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                        5), // Adjust space between text and underline
                                child: Text(
                                  "One Pack Contains:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff363346),
                                    decoration: TextDecoration
                                        .none, // Remove default underline
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0.1,
                                child: Container(
                                  width: 205, // Adjust width to match text length
                                  height: 1.5, // Underline thickness
                                  color: AppColors.primarycolor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                   color: Color(0xff363346),
                                ),
                                children: [
                                  TextSpan(
                                      text:
                                          "Mellons, Lime, Honey, Blueberries,Strawberries, \n"),
                                         
                                  TextSpan(
                                      text: "Mango, Fresh mint.")
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: 0.1,),
                  Padding(
                    padding: const EdgeInsets.only(top: 16,left: 20,right: 20),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              style: TextStyle(
                                fontSize: 12,
                               
                                color: Colors.black,
                                
                              ),
                              children: [
                                TextSpan(
                                    text:
                                        "If you are looking for a new fruit salad to eat today,"),
                                TextSpan(
                                    text:
                                        " mellon is the perfect brunch for you. make")
                              ])),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor:Color(0xfffef5f1),
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
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OrderPage()));
                            },
                            child: Text(
                              "Add to basket",
                              style: TextStyle(fontSize: 14),
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
