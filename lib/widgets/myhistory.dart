import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';
import 'package:fruit_hub_delivery_app/widgets/home_screen_one.dart';

class Order {
  final String restaurant;
  final String orderNumber;
  final double price;
  final String date;
  final String time;
  final int items;
  final String status;
  final String imageUrl;
  final String category;

  Order({
    required this.restaurant,
    required this.orderNumber,
    required this.price,
    required this.date,
    required this.time,
    required this.items,
    required this.status,
    required this.imageUrl,
    required this.category,
  });
}

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final List<Order> _orders = [
    Order(
      restaurant: 'Tropical salad',
      orderNumber: '162432',
      price: 2000,
      date: '29 JAN',
      time: '12:30',
      items: 3,
      status: 'Completed',
      imageUrl: 'assets/images/tropical_fruit.png',
      category: 'Order',
    ),
    Order(
      restaurant: 'Melon salad',
      orderNumber: '242432',
      price: 2000,
      date: '30 JAN',
      time: '12:30',
      items: 2,
      status: 'Completed',
      imageUrl: 'assets/images/Glowing_Berry_Fruit_Salad.png',
      category: 'Order',
    ),
    Order(
      restaurant: 'Quinoa salad',
      orderNumber: '240112',
      price: 2000,
      date: '30 JAN',
      time: '12:30',
      items: 1,
      status: 'Canceled',
      imageUrl: 'assets/images/breakfast_quinoa_red_fruit_salad.png',
      category: 'Order',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    HomeRowPage()));
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
                    "My Basket Orders",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: _orders.length,
                itemBuilder: (context, index) {
                  final order = _orders[index];
                  return _buildOrderItem(order);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(Order order) {
    Color statusColor = Color(0xff059c69);
    if (order.status == 'Canceled') {
      statusColor = Colors.red;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                order.category,
                style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff454754)),
              ),
              const SizedBox(width: 20),
              Text(
                order.status,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      order.imageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 60,
                          height: 60,
                          color: Colors.grey.shade200,
                          child: order.category == 'Food'
                              ? Image.network(
                                  'https://via.placeholder.com/60x60?text=Food',
                                  fit: BoxFit.cover)
                              : Image.network(
                                  'https://via.placeholder.com/60x60?text=Drink',
                                  fit: BoxFit.cover),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              order.restaurant,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '#${order.orderNumber}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                                decoration: TextDecoration.underline,
                                decorationThickness:
                                    1, 
                                decorationColor:
                                    Color(0xffa3a4aa),
                                height:
                                    1.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              '₦ ${order.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 8),
                            const Text(
                              '|',
                              style: TextStyle(color: Color(0xffccced6)),
                            ),
                            SizedBox(width: 8),
                            Row(
                              children: [
                                Text(
                                  '${order.date}, ${order.time}',
                                  style: TextStyle(
                                    fontSize: 11.5,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                const Text(' • '),
                                Text(
                                  '0${order.items} Items',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Buttons
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 33,
                  width: 130,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primarycolor,
                      side: const BorderSide(color: AppColors.primarycolor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Rate',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ),
                // const SizedBox(width: 30),
                SizedBox(
                  height: 33,
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primarycolor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Re-Order',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
