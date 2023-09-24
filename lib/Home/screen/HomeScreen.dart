

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/Home/Widget/BalanceCard.dart';
import 'package:money_management_app/Home/Widget/dashbcard.dart';
import 'package:money_management_app/Home/Widget/transactionCard.dart';
import 'package:money_management_app/Home/controller/transactioncontroller.dart';
import 'package:money_management_app/auth/controller/LoginController.dart';
import 'package:money_management_app/auth/screen/login.dart';
import 'package:money_management_app/helper/LoadingCircle.dart';
import 'package:money_management_app/model/Transaction.dart';

class HomeScreen extends StatefulWidget {
 const  HomeScreen({super.key   });
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {  

 
 final textcontrollerAMOUNT = TextEditingController();
  final textcontrollerITEM = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isIncome = false;
  List<Transactions> list =[];   
 void _newTransaction()  {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                title: const Text(
                  'N E W  T R A N S A C T I O N', 
                  style: TextStyle(
                    fontWeight: FontWeight.w400 , 
                    color: Color.fromARGB(255, 219, 93, 241)
                  ),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         const  Text(
                          'Expense' ,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),

                          ),
                          Switch(
                            activeColor: Colors.purple,
                            value: _isIncome,
                            onChanged: (newValue) {
                              setState(() {
                                _isIncome = newValue;
                              });
                            },
                          ),
                       const  Text(
                          'Income' ,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )),
                        ],
                      ),
                     const  SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Form(
                              key: _formKey,
                              child: TextFormField( 
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration( 
                                  floatingLabelBehavior: FloatingLabelBehavior.always, 
                                  enabledBorder:OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 2 
                                    )
                                  ), 

                                  focusedBorder: OutlineInputBorder(  
                                    
                                    borderSide: BorderSide( 
                                      color: Colors.purple ,
                                      
                                      width: 3

                                    )

                                  ),

                                  hintText: 'Amount?',
                                

                                ),
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Enter an amount';
                                  }
                                  return null;
                                },
                                controller: textcontrollerAMOUNT,
                              ),
                            ),
                          ),
                        ],
                      ),
                    const  SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration( 
                                  floatingLabelBehavior: FloatingLabelBehavior.always, 
                                  enabledBorder:OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 2 
                                    )
                                  ), 

                                  focusedBorder: OutlineInputBorder(  
                                    
                                    borderSide: BorderSide( 
                                      color: Colors.purple ,
                                      
                                      width: 3

                                    )

                                  ),

                                  hintText: 'For what !',
                                

                                ),
                              controller: textcontrollerITEM,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  MaterialButton(
                    
                    child:
                       const  Text('Cancel', style: TextStyle(color: Colors.purple)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    color: Colors.purple,
                    child: const Text('Enter', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) { 
                  setState(() {
                     TransactionController.addTransaction(
                            textcontrollerITEM.text,
                             textcontrollerAMOUNT.text,
                              _isIncome == false ? 'Expense' : 'Income'
                              );  
                        
                              TransactionController.calculateIcome() ;
                               TransactionController.updateBalance() ;

                  },) ;
                          
                              //TransactionController.updateBalance() ;
                          
              
                    
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              );
            },
          );
        });
  }

            
    @override
  Widget build(BuildContext context) {
    return Scaffold(    

    drawer: Drawer(
      child: GestureDetector(child: const Text('Dashboard') ,
       onTap: () { 

       },
      ),
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  FloatingActionButton( 
        backgroundColor: Colors.purple, 
        child: const Icon(
          Icons.add , 
          color: Colors.white,
          ),
        onPressed: () {
          _newTransaction() ;
        },
      ),
      appBar: AppBar( 


        title: const  Text("TRANSACTIONS") , 
        centerTitle:  true,
        backgroundColor: Colors.purpleAccent,

        actions: [  Padding(
          padding: const  EdgeInsets.only(left:20) ,
        child:IconButton(
          onPressed: (() async{
         await  AuthController.signOut() ;  
          Get.to(()=> const LoginScreen()) ;
          }),
           icon: const Icon(
            Icons.logout_rounded ,
            size: 30,
           ))
          
           ),]
        ), 

        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: [  
           const  SizedBox(height: 20) ,
          
          
        StreamBuilder<DocumentSnapshot>(
            stream: TransactionController.getbalanceInfo(),
            builder: (context, snapshot) {
              if(snapshot.hasError) {
              return const Text('Something Went Wrong!' ,
              style: TextStyle( fontSize: 25) 
              ); 
              }  
              if(snapshot.connectionState==ConnectionState.waiting) { 
                return const LoadingCircle() ;
            } 
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return  
            BalanceCard( 
              income: data['income'].toString(),
              balance: data['balance'].toString(), 
              expense:data['expenses'].toString() ,


            ) ;
            }
            
             ),  
             const SizedBox(width:15) , 
             const  DashboardCard() ,
             Expanded( 
              child: Center(
               child: Column(children: [
                  const SizedBox(height: 20) ,
                  Expanded(
                   child: StreamBuilder(  
                     stream: TransactionController.getTransactionInfo(), 
                     builder: (context, snapshot) {
                       if(snapshot.hasError) { 
                         return const Text("Failed to load data") ;
                       } 
                      
                        
                          final data = snapshot.data?.docs; 
                         // print(data) ;
               list =
                   data?.map((e) =>Transactions.fromJson(e.data())).toList() ?? [] ;
                       
                          

                           
                           //print("********$list") ;
                         
                         return ListView.builder( 
                           shrinkWrap: true,
                            physics: const BouncingScrollPhysics(), 
                        
                         itemCount:list.length ,
                         itemBuilder:(context, index) { 

                           return MyTransaction(
                             trans: list[index].expenseOrincome=='Expense' ? '-' '\$${list[index].amount}' : '+'  '\$${list[index].amount}' ,
                             transcolor:list[index].expenseOrincome=='Expense' ? Colors.red :Colors.green , 
                             transname:list[index].transactionname ,
                             datetime: DateFormat.yMMMd().format( DateTime( list[index].year , list[index].month ,list[index].day    )) 

                              
                             );
                         },); 
                     }
                   )  
                    )

               ],)
              )
              
              
              
              ),  

         ] ),
          
          
          
          ));
    
  }
}