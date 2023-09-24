import 'package:flutter/material.dart';
import 'package:money_management_app/Home/controller/transactioncontroller.dart';   
class NewTransaction extends StatefulWidget {
  const NewTransaction({super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {     
  
   final textcontrollerAMOUNT = TextEditingController();
  final textcontrollerITEM = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isIncome = false;
    
  @override
  Widget build(BuildContext context) { 
    return 
    
   AlertDialog(
                  title: const Text('N E W  T R A N S A C T I O N'),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                           const  Text('Expense'),
                            Switch(
                              value: isIncome,
                              onChanged: (newValue) {
                                setState(() {
                                  isIncome = newValue;
                                });
                              },
                            ),
                           const Text('Income'),
                          ],
                        ),
                       const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Form(
                                key: _formKey,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
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
                                  border: OutlineInputBorder(),
                                  hintText: 'For what?',
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
                      color: Colors.grey[600],
                      child:
                         const Text('Cancel', style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    MaterialButton(
                      color: Colors.grey[600],
                      child:const Text('Enter', style: TextStyle(color: Colors.white)),
                      onPressed: () {
                       setState(() {
                        
                         TransactionController.addTransaction(
                            textcontrollerITEM.text,
                             textcontrollerAMOUNT.text,
                              isIncome == false ? 'Expense' : 'Income'
                              );
                         
                       });
                        
                             
                         
                          
                          Navigator.of(context).pop();
                        
                      },
                    )
                  ],
              );
              
            } }
          
        
  
  
      