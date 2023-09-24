import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dashboard/screen/dashboard_screen.dart'; 
class DashboardCard extends StatelessWidget {
  const DashboardCard ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 20),
      child: InkWell( 
        onTap: () { 
          Get.to(const DashboardScreen()) ;
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
                 height: 120,
                  width: 200 ,
                decoration: BoxDecoration( 
                  boxShadow:  [BoxShadow(
                  color: Colors.grey.shade800,
                  offset: const Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
         const  BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0)],
                  color: const Color.fromARGB(255, 187, 69, 207),
                   borderRadius: BorderRadius.circular(25)
                ),
               child: const Padding(
                padding:EdgeInsets.symmetric(horizontal: 20 ,vertical: 15) , 
                child: Row(
                    children: [
                    Image(
                        image: AssetImage("images/stat.png")  ,
                        height: 40, 
                        width: 50, 
                        
                        ) ,  
                        //SizedBox(width: 20) ,
                        Text(
                            ' STATISTICS' , 
                            style: TextStyle(
                              color: Colors.white , 
                              fontSize: 18 , 
                              fontWeight: FontWeight.bold
                            ),
                          )])
                    
                )
                ),
        ),
      ),
      );
    
  }
}