import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:money_management_app/model/Transaction.dart';

import '../../UsernameScreen/uesrcontroller.dart';

class DashController {

   static FirebaseFirestore firestore = FirebaseFirestore.instance ; 
   static get name => UsernameController.usernm ;  
   static final FirebaseAuth firebaseAuth = FirebaseAuth.instance; 
   static User get user =>firebaseAuth.currentUser!;

static Future<List<Transactions>> getCircularData( int date , String range) async{  

 List<Transactions> trans =[] ;
    final queryincome = await firestore
    .collection('users')
    .doc(user.uid)
    .collection('transactions')
    .where('expenseOrincome' ,isEqualTo: 'Income' )
    .where( range,  isEqualTo: date  )
    //.where('date',  isLessThan: enddate   )
    .get();

    double totaleIncome = 0;
    for (var doc in queryincome.docs) { 
       
      String numberField  = (doc.data())["amount"] as String;
      totaleIncome+= double.parse(numberField) ;
    }  

   
    
  final queryexpense = await firestore
    .collection('users')
    .doc(user.uid)
    .collection('transactions')
    .where('expenseOrincome' ,isEqualTo: 'Expense' )
    .where(range,  isEqualTo: date   )
    //.where('date',  isLessThan: enddate   )
    .get() ;

    double totaleExpense = 0;
    for (var doc in queryexpense.docs) {  
      String numberField  = (doc.data())["amount"] as String;
      totaleExpense+= double.parse(numberField) ;
    }   
  
         trans = [ 
         Transactions(
          expenseOrincome: 'Expense(DT)',
           transactionname: '', 
            amount:  totaleExpense.toString() ,
             day: 0,
               month: 0,
                time:  '',
                 year:0
             ) ,  
             Transactions(
          expenseOrincome: 'Income(DT)',
           transactionname: '', 
            amount:  totaleIncome.toString() ,
             day: 0,
               month: 0,
                time:  '',
                 year:0
             ) ,
      
              ] ; 
      return trans ;
}

static Future<List<Transactions>> getchartdata( String exOrinc ,  int date  , String range) async {   
  List<Transactions> transactions =[] ;

 final queryincome = await firestore
    .collection('users')
    .doc(user.uid)
    .collection('transactions')
    .where('expenseOrincome' ,isEqualTo: exOrinc )
    .where( range,  isEqualTo: date   )
    .get();
  
      transactions = queryincome.docs.map((e) => Transactions.fromJson(e.data())).toList() ;   
   
         return transactions ;

}
    

     
}

   


  
