import 'package:flutter/material.dart';

class TrackOrderPage extends StatefulWidget {
  const TrackOrderPage({super.key});

  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), 
        child: AppBar(
          backgroundColor: Colors.orange,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(
                left: 10, top: 15),
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.arrow_back, color: Colors.white),
              label: Text("Go back", style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white24,
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 20), 
            child: Text(
              "Delivery Status",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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