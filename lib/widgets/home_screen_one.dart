import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';
import 'package:fruit_hub_delivery_app/widgets/basket_page.dart';

class HomeRowPage extends StatefulWidget {
  const HomeRowPage({super.key});

  @override
  State<HomeRowPage> createState() => _HomeRowPageState();
}

class _HomeRowPageState extends State<HomeRowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Icon(Icons.menu, color: Colors.black),
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  "assets/images/fa_shopping-basket (1).png",
                  fit: BoxFit.contain,
                  width: 25,
                  height: 25,
                ),
              ),
              SizedBox(height: 2), // Reduce spacing
              Padding(
                padding: const EdgeInsets.only(right: 9),
                child: Text(
                  "My basket",
                  style: TextStyle(fontSize: 9, color: Colors.orange),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 22, color: Colors.black),
                children: [
                  TextSpan(text: "Hello Tony, "),
                  TextSpan(
                    text: "What fruit salad combo do you want today?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xfff3f4f9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintStyle:
                            TextStyle(color: Colors.black38, fontSize: 12),
                        hintText: "Search for fruit salad combos",
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Space between search and icon
                Container(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.tune_rounded, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 35),
            Text(
              "Recommended Combo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 165,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FruitCard("assets/images/Honey_Lime_Peach_Fruit_Salad.png",
                      "Honey lime combo", "₦ 2,000", Colors.white),
                  SizedBox(width: 3),
                  FruitCard("assets/images/Glowing_Berry_Fruit_Salad.png",
                      "Berry mango combo", "₦ 8,000", Colors.white),
                ],
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text("Popular", style: TextStyle(color: Colors.black45)),
                  Text("New combo", style: TextStyle(color: Colors.black45)),
                  Text("Top", style: TextStyle(color: Colors.black45)),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 165,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BasketPage(),
                      ),
                    ),
                    child: FruitCard(
                        "assets/images/breakfast_quinoa_red_fruit_salad.png",
                        "Quinoa fruit salad",
                        "₦ 10,000",
                        Color(0xfffffaec)),
                  ),
                  SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: FruitCard(
                      "assets/images/Tropical_Fruit_Salad.png",
                      "Tropical fruit salad",
                      "₦ 10,000",
                      Color(0xfffef0f0),
                      imageSize: 200,
                    ),
                  ),
                  SizedBox(width: 4),
                  FruitCard(
                      "assets/images/breakfast_quinoa_red_fruit_salad.png",
                      "Quinoa fruit salad",
                      "₦ 10,000",
                      Color(0xfffffaec)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FruitCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final Color backgroundColor;
  final double? imageSize;

  const FruitCard(this.imagePath, this.title, this.price, this.backgroundColor,
      {this.imageSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: backgroundColor,
      child: Container(
        width: 150,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: imageSize ?? 80),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black87),
                ),
              ],
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.only(left: 2, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: TextStyle(color: Colors.orange),
                  ),
                  CircleAvatar(
                    radius: 13,
                    backgroundColor: Color.fromARGB(31, 232, 181, 127),
                    child: Icon(Icons.add,
                        color: AppColors.primarycolor, size: 18),
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
