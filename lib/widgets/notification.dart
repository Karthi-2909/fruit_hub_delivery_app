import 'package:flutter/material.dart';


class NotificationPage extends StatefulWidget {
  final Image profile;
  final Image fruit;
  final String text;
  final Color textColor;
  final String span;
  final double imageSize; 

  const NotificationPage({
    super.key,
    required this.profile,
    required this.fruit,
    required this.text,
    required this.textColor,
    required this.span,
    this.imageSize = 50.0,
  });

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: widget.imageSize,
                height: widget.imageSize,
                child: CircleAvatar(
                  backgroundImage: widget.profile.image, 
                ),
              ),
              const SizedBox(width: 10),
   
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: widget.text,
                    style: TextStyle(fontSize: 14, color: widget.textColor,fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.span,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                          
                        ),
                        
                      ),
                      
                      TextSpan(
                        text: '20 min ago',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        )
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 10),
              
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 202, 159),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: SizedBox(
                  width: widget.imageSize,
                  height: widget.imageSize,
                  child: widget.fruit,
                ),
              ),
            ],
          ),
        ),
        const Divider(thickness: 0.5),
      ],
    );
  }
}
