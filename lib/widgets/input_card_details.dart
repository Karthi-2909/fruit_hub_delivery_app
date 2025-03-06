import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';
import 'package:fruit_hub_delivery_app/widgets/order_complete_page.dart';

class PaymentModal extends StatefulWidget {
  @override
  _PaymentModalState createState() => _PaymentModalState();
}

class _PaymentModalState extends State<PaymentModal> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _ccvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
       width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                // White Section (Form)
                Container(
                  padding: EdgeInsets.all(20),
                  height: 350,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Card Holder Name",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: "Adolphus Chris",
                          hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 14,),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xfff3f1f1),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Card Number",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      TextField(
                        controller: _numberController,
                        decoration: InputDecoration(
                          hintText: "1234 5678 9012 1314",
                          hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 14,),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xfff3f1f1),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Date",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              SizedBox(
                                width: 120,
                                child: TextField(
                                  controller: _dateController,
                                  decoration: InputDecoration(
                                    hintText: "MM/YY",
                                    hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 14,),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xfff3f1f1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 80),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("CCV",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              SizedBox(
                                width: 120,
                                child: TextField(
                                  controller: _ccvController,
                                  decoration: InputDecoration(
                                    hintText: "123",
                                    hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 14,),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xfff3f1f1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            SizedBox(height: 30,),
                // Orange Section (Bottom)
                Container(
                  height: 85,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primarycolor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), 
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: SizedBox(
                      height: 50,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderCompletePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondarycolor,
                          foregroundColor: AppColors.primarycolor,
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Complete Order",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Close Button Positioned Above
          Positioned(
            top: -55,
            right: 90,
            left: 90,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.close, color: Colors.black, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
