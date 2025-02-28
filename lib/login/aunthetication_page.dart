import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';

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
          Expanded(
            // Expands to fill available space without overflow
            flex: 5, // 50% of the screen
            child: Container(
              color: AppColors.primarycolor,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Avoid unnecessary space
                  children: [
                    Image.asset("assets/images/fruit_basket.png"),
                    Image.asset("assets/images/fruit_basket_shadow.png"),
                  ],
                ),
              ),
            ),
          ),

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
                      
                      onPressed: () {},
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
