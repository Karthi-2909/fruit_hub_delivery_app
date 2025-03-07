import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';

class MessagePage extends StatefulWidget {
  final Image profile;
  final String time;
  final String text;
  final Color textColor;
  final String span;
  final Color msgColor;
  final String count;
  final Color circle;
  final Color timeColor;
  final double imageSize; // Added image size parameter

  const MessagePage({
    super.key,
    required this.profile,
    required this.time,
    required this.text,
    required this.textColor,
    required this.span,
    required this.msgColor,
    required this.count,
    required this.circle,
    required this.timeColor,
    this.imageSize = 50.0, // Default size
  });

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: widget.imageSize,
                height: widget.imageSize,
                child: CircleAvatar(
                  backgroundImage:
                      widget.profile.image, // Fix: Use ImageProvider
                ),
              ),
              const SizedBox(width: 10),

              // Fix: Wrap TextSpan inside RichText
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.text,
                      style: TextStyle(
                          fontSize: 16,
                          color: widget.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 3,),
                    Text(
                      widget.span,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: widget.msgColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(widget.time,
                    style: TextStyle(
                      fontSize: 14,
                      color: widget.timeColor,
                    ),),
                  Container(
                     margin: EdgeInsets.only(
                              left: 5,
                              top: 5), // Adds spacing between time and count
                          padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2), // Adds padding inside the box
                    decoration: BoxDecoration(
                              color: widget.circle, // Background color

                              shape: BoxShape.circle // Rounded edges
                              ),
                    child: Text(
                      
                      widget.count,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppColors
                                    .secondarycolor, // Text color inside the box
                              ),),
                  )

                ],
              ),
            ],
          ),
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}
