import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primarycolor),
          onPressed: () {}, // Add navigation logic
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.more_horiz, color: Colors.black),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // Profile Info Section
            Row(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/Vishal_Khadok.png'), // Add image asset
                    ),
                  ],
                ),
                SizedBox(height: 10,width: 10,),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Vishal Khadok",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                                              "I love fruits",
                                              style: TextStyle(fontSize: 14, color: Colors.grey),
                                            ),
                      ],
                    ),
                  ],
                ),
                
                SizedBox(height: 20),
              ],
            ),

            // Menu Sections
            Expanded(
              child: ListView(
                children: [
                  _buildSection([
                    _buildMenuItem(Icons.person_outline, "Personal Info"),
                    _buildMenuItem(Icons.map_outlined, "Addresses"),
                  ]),
                  _buildSection([
                    _buildMenuItem(Icons.shopping_cart_outlined, "Cart"),
                    _buildMenuItem(Icons.favorite_border, "Favourite"),
                    _buildMenuItem(Icons.notifications_outlined, "Notifications"),
                    _buildMenuItem(Icons.payment_outlined, "Payment Method"),
                  ]),
                  _buildSection([
                    _buildMenuItem(Icons.help_outline, "FAQs"),
                    _buildMenuItem(Icons.reviews_outlined, "User Reviews"),
                    _buildMenuItem(Icons.settings_outlined, "Settings"),
                  ]),
                  _buildLogoutButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepOrange),
      title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {}, // Add navigation logic
    );
  }

  Widget _buildSection(List<Widget> items) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))
        ],
      ),
      child: Column(children: items),
    );
  }

  Widget _buildLogoutButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))
        ],
      ),
      child: ListTile(
        leading: Icon(Icons.logout, color: Colors.red),
        title: Text("Log Out", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.red)),
        onTap: () {}, // Add logout logic
      ),
    );
  }
}
