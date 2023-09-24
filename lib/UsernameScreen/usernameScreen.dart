/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_management_app/Home/screen/HomeScreen.dart';
import 'package:money_management_app/UsernameScreen/TextFormField.dart';
import 'package:money_management_app/UsernameScreen/username_butt.dart';
import 'package:money_management_app/UsernameScreen/uesrcontroller.dart';
import 'package:money_management_app/main.dart';
class Username extends StatefulWidget {
  

  const Username({super.key});

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> { 

  UsernameController ctr =Get.put(UsernameController()) ;

  
  @override
  Widget build(BuildContext context) { 
    mq = MediaQuery.of(context).size;
 
    return Scaffold( 
      appBar: AppBar(
title:const Text("Username") ,
centerTitle: true,

      ), 
      body:  SafeArea(
        child: CustomScrollView(  
          slivers: [ 
            SliverFillRemaining(  
              hasScrollBody: false, 
              child: Padding(
                padding: const  EdgeInsets.symmetric( 
                  horizontal: 30
                ),
                child:   Column(
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                      const SizedBox(height: 50) , 
                      const Center( 
                      child: Image(image: AssetImage("images/money.png") ,
                      height:200, 
                      width: 200, 
                      alignment: Alignment.center ,
                      ),
                     ),
                     const SizedBox(height: 80) ,   
                     UsernameTextField(
                      hintText: 'Enter your username',
                       inputText: TextInputType.name,
                      textEditingController: ctr.username ,
                         ),
                     const SizedBox(height: 20) ,  
                     MyTextButton(
                      buttonName: 'GO TO',
                      ontap: (){ setState(() {
                        click() ;
                      }); 

                      },
                      textcolor: Colors.black,
                       bgcolor:const  Color.fromARGB(255, 62, 105, 197)
                       
                       )

                     
                    
                  ],

                ),
                
                
                ),

            )
          ],

        )
        
        
        
        
        )
        
        
        
        
         ,

    );
  } 
 
click() async {   
  
      await ctr.createuser().then((value) {  
     
       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
  const  HomeScreen()), (Route<dynamic> route) => false);
      }
              );
        
    }}
      

    
  




*/