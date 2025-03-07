import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';
// ignore: unused_import
import 'package:fruit_hub_delivery_app/widgets/order_complete_page.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class TrackOrderPage extends StatefulWidget {
  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
  late MapShapeSource dataSource;
  late MapZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    super.initState();
    dataSource = MapShapeSource.asset(
      'assets/images/tamil_nadu.json',
      shapeDataField: 'state',
    );
    _zoomPanBehavior = MapZoomPanBehavior();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primarycolor, 
        child: Column(
          children: [
           
            Container(
              height: 110,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                children: [
                  SizedBox(
                    height: 35,
                    width: 85,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
                    "Delivery Status",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondarycolor,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),
            // Content container with white background
            Expanded(
              child: Container(
                color: Colors.white, // Background color for the content
                child: SingleChildScrollView(
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
                        backgroundColor: Color(0xfffffaed),
                      ),
                      _buildStepConnector(height: 40),
                      _buildStepRow(
                        image: 'assets/images/order_prepare_note.png',
                        iconAsset: '',
                        title: 'Order Is Being Prepared',
                        isCompleted: true,
                        showIcon: false,
                        backgroundColor: Color(0xffefeff5),
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
                        backgroundColor: Color(0xfffef0f0),
                        customIcon: Icon(
                          Icons.phone_in_talk_outlined,
                          color: Colors.white,
                          size: 22,
                        ),
                        iconBackgroundColor: AppColors.primarycolor,
                      ),
                      _buildStepConnector(height: 40),
                      Container(
                        height: 180,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SfMaps(
                            layers: [
                              MapTileLayer(
                                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                zoomPanBehavior: _zoomPanBehavior,
                                initialFocalLatLng: MapLatLng(11.1271, 78.6569),
                                initialZoomLevel: 7,
                              ),
                            ],
                          ),
                        ),
                      ),
                      _buildStepConnector(height: 40),
                      _buildStepRow(
                        image: 'assets/images/tick.png',
                        iconAsset: '',
                        title: 'Order Received',
                        isCompleted: true,
                        isActive: true,
                        showIcon: false,
                        backgroundColor: Color(0xffeffef7),
                        customIcon: Icon(
                          Icons.more_horiz,
                          color: AppColors.primarycolor,
                          size: 28,
                        ),
                        iconBackgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
    required Color backgroundColor,
    Icon? customIcon,
    Color? iconBackgroundColor,
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
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
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
        if (isCompleted && customIcon == null)
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 22,
          ),
        if (customIcon != null)
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBackgroundColor ?? Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: customIcon,
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
      child: CustomPaint(
        size: Size(2, height), 
        painter: _DottedLinePainter(),
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.primarycolor 
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double dashWidth = 1; 
    double dashSpace = 5;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}