import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';
import 'package:fruit_hub_delivery_app/widgets/input_card_details.dart';
import 'package:fruit_hub_delivery_app/widgets/order_complete_page.dart';
class DeliveryAddressModal extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController numberController;

  const DeliveryAddressModal({
    Key? key,
    required this.nameController,
    required this.numberController,
  }) : super(key: key);

  @override
  _DeliveryAddressModalState createState() => _DeliveryAddressModalState();
}

class _DeliveryAddressModalState extends State<DeliveryAddressModal> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: AppColors.secondarycolor,
          padding: EdgeInsets.all(20),
          height: 400,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.secondarycolor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.transparent,
                  spreadRadius: 10,
                  blurRadius: 0,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
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
                  controller: widget.nameController,
                  decoration: InputDecoration(
                    hintText: "10th avenue, Lekki, Lagos State",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 0)),
                    filled: true,
                    fillColor: const Color(0xfff3f1f1),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                  controller: widget.numberController,
                  decoration: InputDecoration(
                    hintText: "09090605708",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 0)),
                    filled: true,
                    fillColor: const Color(0xfff3f1f1),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderCompletePage()));
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.secondarycolor,
                        foregroundColor: AppColors.primarycolor,
                        side: BorderSide(
                            color: AppColors.primarycolor, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Pay on delivery",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return PaymentModal();
                          },
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.secondarycolor,
                        foregroundColor: AppColors.primarycolor,
                        side: BorderSide(
                            color: AppColors.primarycolor, width: 2),
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
        ),
        Positioned(
          top: -50,
          right: 90,
          left: 90,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              backgroundColor: AppColors.secondarycolor,
              child: Icon(
                Icons.close,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
