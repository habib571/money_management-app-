import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_management_app/Home/screen/HomeScreen.dart';
import 'package:money_management_app/dashboard/screen/year_dash.dart';

import 'day_dash.dart';
import 'month_dash.dart'; 



class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  final colorstheme =const  Color(0xff4b4b87);

  TabController? _tabController;

  @override
  void initState() {
    _tabController =  TabController(length: 3, vsync: this, initialIndex: 0)
      ..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200 ,
      appBar: AppBar( 
        backgroundColor: Colors.purple,
        toolbarHeight: 47,
        title: const Text(
          'Dashboard',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
      //  shadowColor:const  Color.fromARGB(0, 136, 54, 54),
        leading: Padding(
          padding:  const EdgeInsets.only(left:15.0),
          child: IconButton(
            icon:const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
           onPressed: () { 
                            Get.to(()=>const HomeScreen()) ;
                            },
          ),
        ),
      ),
      body: Column(
        children: [ 
         const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[200]),
            child: TabBar( 
              
                isScrollable: true,
               indicatorPadding:const  EdgeInsets.all(4),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.purple,
                labelStyle:const  TextStyle(fontSize: 20),
               labelPadding:
                 const   EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                indicator: BoxDecoration(
                    color: Colors.purple ,
                    borderRadius: BorderRadius.circular(15)),
                controller: _tabController,
                tabs:const [
                  Text('Day'),
                  Text('Month'),
                  Text('Year'),
                ]),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController, children: const [  
                DashDay(),
                DashMonth(),
                DashyYear()
             
          
            ]),
          )
        ],
      ),
    );
  }
}