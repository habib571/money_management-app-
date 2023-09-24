
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/UsernameScreen/uesrcontroller.dart';
import 'package:money_management_app/model/Transaction.dart';
import 'package:money_management_app/model/user.dart';

class TransactionController  {   
 
static FirebaseFirestore firestore = FirebaseFirestore.instance ; 
static get name => UsernameController.usernm ;  
static final FirebaseAuth firebaseAuth = FirebaseAuth.instance; 
static User get user =>firebaseAuth.currentUser!;

static  updateBalance() async {   


final inc = await calculateIcome() ; 
final exp = await calculateExpense() ; 
final bal = inc -exp ;
//final bal = inc -ex ;
  final trans = Moneyuser
  ( name: user.uid,
   expenses: exp ,
    income: inc ,
     balance: bal
  );
 
     return  await firestore 
     .collection('users') 
     .doc(user.uid).set(trans.tojson()) ; 

     
}

 static Stream<DocumentSnapshot<Map<String, dynamic>>> getbalanceInfo() {  
     return firestore
     .collection('users')
     .doc(user.uid)
     .snapshots();
   } 

 static Stream<QuerySnapshot<Map<String, dynamic>>> getTransactionInfo() { 
     return firestore
     .collection('users')
     .doc(user.uid)
     .collection('transactions')
     .snapshots();
   } 


    static Future<double> calculateIcome() async {
    final querySnapshot = await firestore.collection('users').doc(user.uid).collection('transactions').where('expenseOrincome' ,isEqualTo: 'Income' ).get();
    double totaleIncome = 0;
    for (var doc in querySnapshot.docs) { 
       
      String numberField  = (doc.data())["amount"] as String;
      totaleIncome+= double.parse(numberField) ;
    }  
     return totaleIncome;
     }

  static Future<double> calculateExpense() async{  

  final querySnapshot = await firestore.collection('users').doc(user.uid).collection('transactions').where('expenseOrincome' ,isEqualTo: 'Expense' ).get();
    double totaleExpense = 0;
    for (var doc in querySnapshot.docs) { 
       
      String numberField  = (doc.data())["amount"] as String;
      totaleExpense+= double.parse(numberField) ;
    }  
     return totaleExpense;
} 

 static addTransaction(String transname ,amount, exOrInc) async {   
 final date = DateTime.now() ;  
  
         final trans = Transactions(
    expenseOrincome: exOrInc , 
    transactionname: transname,
     amount: amount , 
     day: date.day , 
     time: DateFormat.Hm().format(date)  , 
      month: date.month,
      year: date.year
     ); 
     return  await firestore
     .collection('users')
     .doc(user.uid)
     .collection('transactions')
     .add(trans.tojson())  ;
     

}


}