import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';

class TrackOrderPage extends StatefulWidget {
  const TrackOrderPage({super.key});

  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.primarycolor,
             
            ),
            child: Row(
              children: [
                ElevatedButton.icon(
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
                SizedBox(width: 10),
                Text(
                  "Delivery Status",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondarycolor,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),


          Expanded(
            child: ListView(
              children: [
                DeliveryStep(
                  iconPath: "assets/images/order_taken.png",
                  title: "Order Taken",
                  isCompleted: true,
                ),
                DeliveryStep(
                  iconPath: "assets/images/preparing.png",
                  title: "Order Is Being Prepared",
                  isCompleted: true,
                ),
                DeliveryStep(
                  iconPath: "assets/images/delivery.png",
                  title: "Order Is Being Delivered",
                  subtitle: "Your delivery agent is coming",
                  isCompleted: false,
                  showCallButton: true,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/map_placeholder.png",
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                DeliveryStep(
                  iconPath: "assets/images/received.png",
                  title: "Order Received",
                  isCompleted: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryStep extends StatelessWidget {
  final String iconPath;
  final String title;
  final String? subtitle;
  final bool isCompleted;
  final bool showCallButton;

  const DeliveryStep({
    required this.iconPath,
    required this.title,
    this.subtitle,
    required this.isCompleted,
    this.showCallButton = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 22,
              child: Image.asset(iconPath, width: 30),
            ),
            Container(
              width: 2,
              height: 50,
              color: Colors.orange.shade300,
            ),
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  if (isCompleted)
                    Icon(Icons.check_circle, color: Colors.green)
                  else if (showCallButton)
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.orange.shade300,
                      child: Icon(Icons.phone, color: Colors.white, size: 18),
                    ),
                ],
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
            ],
          ),
        ),
      ],
    );
  }
}