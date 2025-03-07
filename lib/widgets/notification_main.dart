import 'package:flutter/material.dart';
import 'package:fruit_hub_delivery_app/widgets/message.dart';
import 'package:fruit_hub_delivery_app/widgets/notification.dart';
import 'package:fruit_hub_delivery_app/utils/colors.dart';

class NotificationMain extends StatefulWidget {
  const NotificationMain({super.key});

  @override
  State<NotificationMain> createState() => _NotificationMainState();
}

class _NotificationMainState extends State<NotificationMain> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _appBarTitle = "Notifications";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        
        _appBarTitle = _tabController.index == 0 ? "Notifications" : "Messages";
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: AppColors.secondarycolor,
          backgroundColor: AppColors.primarycolor,
          title: Text(
            _appBarTitle,
            style: TextStyle(
              color: AppColors.secondarycolor,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            labelColor: AppColors.secondarycolor,
            indicatorColor: AppColors.secondarycolor,
            unselectedLabelColor: const Color(0xffd8d8e0),
            labelStyle: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              Tab(text: 'Notifications'),
              Tab(text: 'Messages(3)'),
            ],
          ),
          
        ),
        body: TabBarView(
          controller: _tabController,
          
          children: [
            SizedBox(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  NotificationPage(profile:Image.asset("assets/images/Tanbir_Ahmed.jpg") , fruit: Image.asset("assets/images/quinoa_fruit_salad.png"), text: 'Tanbir Ahmed', textColor:Colors.black, span: ' Placed a \nnew order\n\n'),
                  NotificationPage(profile: Image.asset("assets/images/Salim_Smith.jpg"), fruit: Image.asset("assets/images/Honey_Lime_Peach_Fruit_Salad.png"), text: 'Salim Smith', textColor: Colors.black,span: ' left a 5 star \nreview\n\n'),
                  NotificationPage(profile: Image.asset("assets/images/Royal_Bengol.jpg"), fruit: Image.asset("assets/images/Glowing_Berry_Fruit_Salad.png"), text: 'Royal Bengol', textColor: Colors.black,span: ' agreed to \ncancel\n\n'),
                  NotificationPage(profile: Image.asset("assets/images/Pabel_Vuiya.jpg"), fruit: Image.asset("assets/images/breakfast_quinoa_red_fruit_salad.png"), text: 'Pabel Vuiya', textColor: Colors.black,span: ' Placed a \nnew order\n\n'),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  MessagePage(profile: Image.asset("assets/images/Royal_Parvej.jpg"), time: "19:37", text: "Royal Parvej", textColor: Colors.black, span: 'Sounds awesome!',msgColor: Colors.black,count: '1',circle: AppColors.primarycolor,timeColor: Colors.black,),
                  MessagePage(profile: Image.asset("assets/images/Cameron_Williamson.jpg"), time: "19:37", text: "Cameron Williamson", textColor: Colors.black, span: 'Ok, just hurry up little bit...😊',msgColor: Colors.black,count: '2',circle: AppColors.primarycolor,timeColor: Colors.black,),
                  MessagePage(profile: Image.asset("assets/images/Ralph_Edwards.jpg"), time: "19:37", text: "Ralph Edwards", textColor: Colors.black, span: 'Thanks dude.',msgColor: Colors.grey,count: '',circle: Colors.transparent,timeColor: Colors.grey,),
                  MessagePage(profile: Image.asset("assets/images/Cody_Fisher.jpg"), time: "19:37", text: "Cody Fisher", textColor: Colors.black, span: 'How is going...?',msgColor: Colors.grey,count: '',circle: Colors.transparent,timeColor: Colors.grey,),
                  MessagePage(profile: Image.asset("assets/images/Eleanor_Pena.jpg"), time: "19:37", text: "Eleanor Pena", textColor: Colors.black, span: 'Thanks for the awesome fruit man...!',msgColor: Colors.grey,count: '',circle: Colors.transparent,timeColor: Colors.grey,)
                 // MessagePage(profile: profile, time: time, text: text, textColor: textColor, span: span, msgColor: msgColor, count: count, circle: circle)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
