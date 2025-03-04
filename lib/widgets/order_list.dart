import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';
import 'package:fruit_hub_delivery_app/widgets/order_complete_page.dart';
import 'package:intl/intl.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _ccvController = TextEditingController();

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
    Colors.orange.shade100,
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
          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.primarycolor,
              width: double.infinity,
              child: Row(
                children: [
                  const SizedBox(width: 12,),
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
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Center(
                    child: Text(
                      "My Basket",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondarycolor,
                        fontSize: 21,
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
                itemCount: basketItems.length,
                itemBuilder: (context, index) {
                  final item = basketItems[index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: boxColors[index % boxColors.length],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:
                              Image.asset(item['image'], width: 50, height: 50),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['name'],
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 3,),
                            Text("${item['quantity']}",
                                style: const TextStyle(
                                    fontSize: 11, color: Colors.black87)),
                          ],
                        ),
                        trailing: Text(
                          "\u20A6 ${formatPrice(item['price'] * 1000)}",
                          style: const TextStyle(
                              fontSize: 15.5,
                            
                              color: Colors.black87),
                        ),
                      ),
                      const Divider(thickness: 0.15, color: Colors.grey),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
            
            SizedBox(
  width: 180,
  height: 50, // Makes the button take full width
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primarycolor,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) {
                      return Stack(clipBehavior: Clip.none, children: [
                        Container(
                          color: AppColors.secondarycolor,
                          padding: EdgeInsets.all(20),
                          height: 400,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  //SizedBox(height: 40,),
                                  Text(
                                    "Delivery address",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  hintText: "10th avenue, Lekki, Lagos State",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(width: 0)),
                                  filled: true,
                                  fillColor: const Color(0xfff3f1f1),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Number we can call",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                controller: _numberController,
                                decoration: InputDecoration(
                                  hintText: "09090605708",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(width: 0)),
                                  filled: true,
                                  fillColor: const Color(0xfff3f1f1),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                ),
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OutlinedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OrderCompletePage()));
                                      },
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.secondarycolor,
                                        foregroundColor: AppColors.primarycolor,
                                        side: BorderSide(
                                            color: AppColors.primarycolor,
                                            width: 2),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Text(
                                        "Pay on delivery",
                                        style: TextStyle(fontSize: 16),
                                      )),
                                  OutlinedButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return Container(
                                            height: 600,
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
                                                Column(
                                                  children: [
                                                    // White Section (Form)
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(20),
                                                      height: 450,
                                                      color: Colors.white,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              "Card Holder's Name",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          SizedBox(height: 10),
                                                          TextField(
                                                            controller:
                                                                _nameController,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  "Adolphus Chris",
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                borderSide:
                                                                    BorderSide
                                                                        .none,
                                                              ),
                                                              filled: true,
                                                              fillColor: Color(
                                                                  0xfff3f1f1),
                                                            ),
                                                          ),
                                                          SizedBox(height: 20),
                                                          Text("Card Number",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          SizedBox(height: 10),
                                                          TextField(
                                                            controller:
                                                                _numberController,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  "1234 5678 9012 1314",
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                borderSide:
                                                                    BorderSide
                                                                        .none,
                                                              ),
                                                              filled: true,
                                                              fillColor: Color(
                                                                  0xfff3f1f1),
                                                            ),
                                                          ),
                                                          SizedBox(height: 20),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text("Date",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.bold)),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    TextField(
                                                                      controller:
                                                                          _dateController,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "MM/YY",
                                                                        border:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          borderSide:
                                                                              BorderSide.none,
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            Color(0xfff3f1f1),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 20),
                                                              Expanded(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text("CCV",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.bold)),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    TextField(
                                                                      controller:
                                                                          _ccvController,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "123",
                                                                        border:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          borderSide:
                                                                              BorderSide.none,
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            Color(0xfff3f1f1),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    // Orange Section (Bottom)
                                                    Container(
                                                      height: 150,
                                                      width: double.infinity,
                                                      color: AppColors
                                                          .primarycolor,
                                                      child: Center(
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            OrderCompletePage()));
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                AppColors
                                                                    .secondarycolor,
                                                            foregroundColor:
                                                                AppColors
                                                                    .primarycolor,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        50,
                                                                    vertical:
                                                                        15),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                          child: Text(
                                                              "Order Complete",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      18)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                // Close Button Positioned Above
                                                Positioned(
                                                  top: -50,
                                                  right: 90,
                                                  left: 90,
                                                  child: InkWell(
                                                    onTap: () =>
                                                        Navigator.pop(context),
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: Icon(Icons.close,
                                                          color: Colors.black,
                                                          size: 20),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: AppColors.secondarycolor,
                                      foregroundColor: AppColors.primarycolor,
                                      side: BorderSide(
                                          color: AppColors.primarycolor,
                                          width: 2),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      "Pay with card",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            top: -50,
                            right: 90,
                            left: 90,
                            child: InkWell(
                              child: Center(
                                child: CircleAvatar(
                                  backgroundColor: AppColors.secondarycolor,
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ))
                      ]);
                    });
              },
              child: Text(
                "Checkout",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
