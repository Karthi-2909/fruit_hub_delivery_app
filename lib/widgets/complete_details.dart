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
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white, // Changed to white
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), 
              topRight: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Padding(
            padding: const EdgeInsets.only(top: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivery address",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                      color: Color(0xff3c365b),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: widget.nameController,
                  decoration: InputDecoration(
                    hintText: "10th Avenue, Lekki, Lagos State",
                    hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 14,),
                    filled: true,
                    fillColor: Color(0xfff3f1f1), // Same as PaymentModal
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Number we can call",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3c365b),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: widget.numberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "09090605708",
                    hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 14,),
                    filled: true,
                    fillColor: Color(0xfff3f1f1),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPaymentButton(
                        text: "Pay on delivery",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderCompletePage(),
                            ),
                          );
                        },
                      ),
                      _buildPaymentButton(
                        text: "Pay with card",
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) => PaymentModal(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -58,
          // right: 90,
          // left: 90,
          left: MediaQuery.of(context).size.width / 2 - 22,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.close,
                color: Colors.black,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentButton({required String text, required VoidCallback onTap}) {
    return SizedBox(
      height: 50,
      width: 115,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
           padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 14),
          backgroundColor: AppColors.secondarycolor,
          foregroundColor: AppColors.primarycolor,
          side: BorderSide(color: AppColors.primarycolor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
