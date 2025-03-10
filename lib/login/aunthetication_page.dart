import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';
import 'package:fruit_hub_delivery_app/widgets/home_screen_one.dart';

class AuntheticationPage extends StatefulWidget {
  const AuntheticationPage({super.key});

  @override
  State<AuntheticationPage> createState() => _AuntheticationPageState();
}

class _AuntheticationPageState extends State<AuntheticationPage> {
  final TextEditingController _nameController = TextEditingController();
  String? _errorText;

  void _validateAndProceed() {
    setState(() {
      if (_nameController.text.isEmpty) {
        _errorText = "Name cannot be empty";
      } else if (_nameController.text.length < 3) {
        _errorText = "Name must be at least 3 characters long";
      } else {
        _errorText = null;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeRowPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                children: [
                  // Top Section with Image
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
                              child: Image.asset(
                                'assets/images/fruit_basket.png',
                                height: 260,
                                width: 330,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Image.asset(
                              'assets/images/fruit_basket_shadow.png',
                              width: 260,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Bottom Section with TextField and Button
                  Container(
                    color: AppColors.secondarycolor,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question
                        Text(
                          "What is your firstname?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 82, 79, 79),
                        ),),

                      SizedBox(height: 10),

                        // TextField
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: "Tony",
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            errorText: _errorText,
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Start Ordering Button
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _validateAndProceed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primarycolor,
                              foregroundColor: AppColors.secondarycolor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Start Ordering",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}