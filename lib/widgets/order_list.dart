import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';
import 'package:fruit_hub_delivery_app/widgets/complete_details.dart';
import 'package:intl/intl.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  final List<Map<String, dynamic>> basketItems = [
    {
      'image': 'assets/images/quinoa_fruit_salad.png',
      'name': 'Quinoa fruit salad',
      'quantity': '2packs',
      'price': 20
    },
    {
      'image': 'assets/images/Honey_Lime_Peach_Fruit_Salad.png',
      'name': 'Melon fruit salad',
      'quantity': '2packs',
      'price': 20
    },
    {
      'image': 'assets/images/Tropical_Fruit_Salad.png',
      'name': 'Tropical fruit salad',
      'quantity': '2packs',
      'price': 20
    },
  ];

  final List<Color> boxColors = [
    Color(0xfffffaeb),
    Color(0xfff1eff6),
    Color(0xfffef0f0),
  ];

  double getTotalPrice() {
    return basketItems.fold(0, (sum, item) => sum + item['price'] * 1000);
  }

  String formatPrice(double price) {
    return NumberFormat("#,##0").format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
                  "My Basket",
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
            child: ListView.builder(
              itemCount: basketItems.length,
              itemBuilder: (context, index) {
                final item = basketItems[index];
                return ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: boxColors[index % boxColors.length],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(item['image'], width: 50, height: 50),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['name'],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("${item['quantity']}",
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black)),
                    ],
                  ),
                  trailing: Text(
                    "\u20A6 ${formatPrice(item['price'] * 1000)}",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),

                );
              },
              
            ),
          
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total \n \u20A6 ${formatPrice(getTotalPrice())}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primarycolor,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      builder: (context) {
                        return DeliveryAddressModal(
                          nameController: _nameController,
                          numberController: _numberController,
                        );
                      },
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                    );
                  },
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
