import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderHistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {
      'type': 'Food',
      'status': 'Completed',
      'restaurant': 'Pizza Hut',
      'orderNumber': '#162432',
      'price': 35.25,
      'date': '29 JAN, 12:30',
      'items': '03 Items',
    },
    {
      'type': 'Drink',
      'status': 'Completed',
      'restaurant': 'McDonald',
      'orderNumber': '#242432',
      'price': 40.15,
      'date': '30 JAN, 12:30',
      'items': '02 Items',
    },
    {
      'type': 'Drink',
      'status': 'Canceled',
      'restaurant': 'Starbucks',
      'orderNumber': '#240112',
      'price': 10.20,
      'date': '30 JAN, 12:30',
      'items': '01 Items',
    },
  ];

  String formatPrice(num price) {
    return NumberFormat("#,##0.00").format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Orders'),
        backgroundColor: Colors.orange, // Adjust the color as needed
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Ongoing', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('History', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              order['type'],
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: order['status'] == 'Completed'
                                    ? Colors.green[100]
                                    : Colors.red[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                order['status'],
                                style: TextStyle(
                                    color: order['status'] == 'Completed'
                                        ? Colors.green
                                        : Colors.red),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          order['restaurant'],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${order['orderNumber']} • ${order['date']} • ${order['items']}',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${formatPrice(order['price'])}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // Handle rate action
                                  },
                                  child: Text('Rate',
                                      style: TextStyle(color: Colors.orange)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Handle re-order action
                                  },
                                  child: Text('Re-Order',
                                      style: TextStyle(color: Colors.orange)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}