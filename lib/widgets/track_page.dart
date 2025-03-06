import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';

class TrackOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
         preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: AppColors.primarycolor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('Delivery Status'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStepRow(
                image: 'assets/images/order_taken.png',
                iconAsset: '',
                title: 'Order Taken',
                isCompleted: true,
                showIcon: false,
                backgroundColor:Color(0xfffffaed), // Light red
              ),
              _buildStepConnector(height: 40),
              _buildStepRow(
                image: 'assets/images/order_prepare_note.png',
                iconAsset: '',
                title: 'Order Is Being Prepared',
                isCompleted: true,
                showIcon: false,
                backgroundColor: Color(0xffefeff5), // Light purple
              ),
              _buildStepConnector(height: 40),
              _buildStepRow(
                image: 'assets/images/delivery_man.png',
                iconAsset: '',
                title: 'Order Is Being Delivered',
                isCompleted: false,
                isActive: true,
                subtitle: 'Your delivery agent is coming',
                showIcon: false,
                backgroundColor: Color(0xfffef0f0), // Light orange
              ),
              _buildStepConnector(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: _buildMapPlaceholder(),
              ),
              _buildStepConnector(height: 40),
              _buildStepRow(
                image: 'assets/images/tick.png',
                iconAsset: '',
                title: 'Order Received',
                isCompleted: true,
                isActive: true,
                showIcon: false,
                backgroundColor: Color(0xffeffef7), // Light green
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepRow({
    String? image,
    required String iconAsset,
    required String title,
    bool isCompleted = false,
    bool isActive = false,
    String? subtitle,
    bool showIcon = true,
    required Color backgroundColor, // New parameter for background color
  }) {
    return Row(
      children: [
        if (image != null)
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: backgroundColor, // Use the provided background color
                borderRadius: BorderRadius.circular(8), // Square border radius
              
              ),
              child: Center(
                child: Image.asset(
                  image,
                  width: 30,
                  height: 30,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.error,
                      color: Colors.grey,
                      size: 30,
                    );
                  },
                ),
              ),
            ),
          ),
        Expanded(
          child: _buildStepItem(
            iconAsset: iconAsset,
            title: title,
            isCompleted: isCompleted,
            isActive: isActive,
            subtitle: subtitle,
            showIcon: showIcon,
          ),
        ),
      ],
    );
  }

  Widget _buildStepItem({
    required String iconAsset,
    required String title,
    bool isCompleted = false,
    bool isActive = false,
    String? subtitle,
    bool showIcon = true,
  }) {
    return Row(
      children: [
        if (showIcon)
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted 
                ? Colors.green 
                : (isActive ? Colors.orange : Colors.grey.shade300),
            ),
            child: Center(
              child: Image.asset(
                iconAsset,
                width: 24,
                height: 24,
                color: isCompleted || isActive ? Colors.white : Colors.grey,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.check_circle,
                    color: isCompleted ? Colors.white : Colors.grey,
                    size: 24,
                  );
                },
              ),
            ),
          ),
        SizedBox(width: showIcon ? 16 : 0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isCompleted || isActive ? Colors.black : Colors.grey,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStepConnector({double height = 50}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        width: 2,
        height: height,
        color: Colors.grey.shade300,
      ),
    );
  }

  Widget _buildMapPlaceholder() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
     ),
);}
}