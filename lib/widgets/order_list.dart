import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';
// ignore: unused_import
import 'package:fruit_hub_delivery_app/widgets/basket_page.dart';
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
      'price': 20.0
    },
    {
      'image': 'assets/images/BerryWorld.png',
      'name': 'Melon fruit salad',
      'quantity': '2packs',
      'price': 20.0
    },
    {
      'image': 'assets/images/Tropical_Fruit_Salad.png',
      'name': 'Tropical fruit salad',
      'quantity': '2packs',
      'price': 20.0
    },
  ];

  final List<Color> boxColors = [
    Color(0xfffffaeb),
    Color(0xfff1eff6),
    Color(0xfffef0f0),
  ];

  double getTotalPrice() {
    return basketItems.fold(
        0.0, (double sum, item) => sum + item['price'] * 1000.toDouble());
  }

  String formatPrice(num price) {
    return NumberFormat("#,##0").format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.white),
      body: Column(
        children: [
          Container(
            height: 110,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.primarycolor,
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 35,
                  width: 85,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                       Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back_ios_new_outlined,
                            color: Colors.black, size: 15),
                        Text(
                          "Go back",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Text(
                  "My Basket",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondarycolor,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // Replaced Flexible with Expanded
            child: ListView.builder(
              itemCount: basketItems.length,
              itemBuilder: (context, index) {
                final item = basketItems[index];
                return Column(
                  children: [
                    ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: boxColors[index % boxColors.length],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:
                            Image.asset(item['image'], width: 38, height: 70),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['name'],
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text("${item['quantity']}",
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black)),
                        ],
                      ),
                      trailing: Text(
                        "\u20A6 ${formatPrice(item['price'] * 1000)}",
                        style: const TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff3c394c),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Divider(thickness: 0.13, color: Colors.grey),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff322e47)),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "\u20A6 ${formatPrice(getTotalPrice())}",
                      style: TextStyle(
                          letterSpacing: 1.3,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff322e47)),
                    ),
                    Divider(thickness: 1, color: Colors.grey),
                  ],
                ),
                SizedBox(
                  width: 190,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primarycolor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
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
