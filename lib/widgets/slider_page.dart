import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/login/welcome_page.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final List<Map<String, String>> imgList = [
    {"image": "assets/images/first_slide.jpg", "text": "All your favorites", "content": "Get all your loved fruits in one once place,\n  you just place the order we do the rest"},
    {"image": "assets/images/second_slide.jpg", "text": "All your favorites","content": "Get all your loved fruits in one once place,\n  you just place the order we do the rest"},
    {"image": "assets/images/third_slide.jpg", "text": "All your favorites","content": "Get all your loved fruits in one once place,\n  you just place the order we do the rest"},
    {"image": "assets/images/fourth_slide.jpg", "text": "All your favorites","content": "Get all your loved fruits in one once place,\n  you just place the order we do the rest"}
  ];

  int _currentPage = 0;

  @override
  
  Widget build(BuildContext context) {
    
    return Container(
      color: AppColors.secondarycolor,
      child: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 400,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                viewportFraction: 0.8,
                onPageChanged: (value, _){
                  setState(() {
                    _currentPage = value;
                  });
                }
            
              ),
              items: imgList.map((item) => Container(
                height: 1000,
                width: 300,
                   // margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: AppColors.primarycolor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            item["image"]!,
                            fit: BoxFit.cover,
                            width: 200,
                            height: 200,
                            
                          ),
                        ),
                        SizedBox(height: 10),
                        
                        Container(
                          padding: EdgeInsets.all(10.0),
                
                          child: Text(
                            item["text"]!,
                            style: TextStyle(
                              color: AppColors.secondarycolor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                
                          child: Text(
                            item["content"]!,
                            style: TextStyle(
                              color: AppColors.secondarycolor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ))
                  
                  .toList(),
                  
            ),
            SizedBox(height: 10,),
            buildCarouselIndicator(),
             SizedBox(height: 20), // Space between indicator and button
          ElevatedButton(
            onPressed: () {
              // Add navigation or action here
              Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => WelcomePage())
      
        );
              
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primarycolor,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "Get Started",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20), // Extra space at the bottom
          ],
        ),
      ),
    );
    
  }

  
  buildCarouselIndicator(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(int i = 0; i < imgList.length; i++)
        Container(
          margin: const EdgeInsets.all(5),
          height: i == _currentPage ? 7 : 5,
          width: i == _currentPage ? 7 : 5,
          decoration: BoxDecoration(
            color: i == _currentPage ? AppColors.primarycolor : Colors.grey,
            shape: BoxShape.circle,
          ),
        )
      ],
    );
  }
}

