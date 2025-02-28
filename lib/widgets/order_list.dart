import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final List<Map<String, dynamic>> basketItems = [
    {'image': 'assets/images/apple.png', 'name': 'Apple', 'quantity': '2 packs', 'price': 2.99},
    {'image': 'assets/images/banana.png', 'name': 'Banana', 'quantity': '3 bunches', 'price': 1.49},
    {'image': 'assets/images/orange.png', 'name': 'Orange', 'quantity': '1 bag', 'price': 3.99},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.primarycolor,
              width: double.infinity,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      backgroundColor: Colors.white, 
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                    label: const Text(
                      "Go Back",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Center(
                    child: Text(
                      "My Basket",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondarycolor,
                        fontSize: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              color: AppColors.secondarycolor,
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: basketItems.length,
                itemBuilder: (context, index) {
                  final item = basketItems[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: Image.asset(item['image'], width: 50, height: 50),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['name'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text("Quantity: ${item['quantity']}", style: const TextStyle(fontSize: 14, color: Colors.grey)),
                        ],
                      ),
                      trailing: Text(
                        "\$${item['price'].toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
