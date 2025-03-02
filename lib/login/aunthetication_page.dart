import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';
import 'package:fruit_hub_delivery_app/widgets/home_screen_one.dart';

class AuntheticationPage extends StatefulWidget {
  const AuntheticationPage({super.key});

  @override
  State<AuntheticationPage> createState() => _AuntheticationPageState();
}

class _AuntheticationPageState extends State<AuntheticationPage> {
  final TextEditingController _nameController =
      TextEditingController(); // Controller for text field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Primary Theme Container with Images
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
                        'assets/images/fruit_basket.png', 
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

          // Secondary Theme Container with TextBox
          Expanded(
            // Expands to fit remaining space
            flex: 4, // 40% of the screen
            child: Container(
              color: AppColors.secondarycolor,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centers content vertically
                children: [
                  // Question
                  Text(
                    "What is your firstname?",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),

                  SizedBox(height: 10), // Space between text and TextBox

                  // TextField (Input Box)
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: "Tony",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 219, 218, 218),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeRowPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primarycolor,
                        foregroundColor: AppColors.secondarycolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                      child: Text(
                        "Start Ordering",
                        style: TextStyle(
                            fontSize: 18),
                      ),
                    ),
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
