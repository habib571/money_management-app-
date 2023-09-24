/*import 'package:flutter/material.dart';


// ignore: must_be_immutable
class DatePicker extends StatelessWidget {
   const DatePicker({
    super.key , 
    required this.select ,
     required this.submit , 
     required this.controller
    
    }); 
   final String select ; 
   final Function submit ;
   final TextEditingController controller ;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox( 
          height: 60, 
          width: 150,
          child: TextFormField(  
          
         readOnly: true,
            controller: controller,  
            decoration:  InputDecoration(
              icon: const Icon(Icons.calendar_today_rounded) ,   
              enabledBorder: const OutlineInputBorder( 
                  borderRadius: BorderRadius.all(Radius.circular(13)) ,
              
                borderSide: BorderSide(
                  color: Colors.purple ,
                  width: 3
                )
        
              ), 
              
              iconColor: Colors.purple ,
              labelText: select ,
              focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(13)) ,
              
              borderSide: BorderSide(
                color:  Colors.purple  ,
                width: 3
      
                ) ,
                
      
      
               ) ,  
            ),
             
            onTap: submit ()
             
            
   
          ),
        ); 
  }
}



import 'package:intl/intl.dart';

import '../dashcontroller/dashcontroller.dart';

// ...

static Future<List<Transactions>> getChartData(String exOrInc, DateTime selectedDate) async {
  List<Transactions> transactions = [];

  final startDateTime = DateTime(selectedDate.year, selectedDate.month, selectedDate.day, 1, 0); // Start of the day
  final endDateTime = DateTime(selectedDate.year, selectedDate.month, selectedDate.day, 23, 59); // End of the day

  final query = await firestore
      .collection('users')
      .doc(user.uid)
      .collection('transactions')
      .where('expenseOrincome', isEqualTo: exOrInc)
      .where('timestamp', isGreaterThanOrEqualTo: startDateTime)
      .where('timestamp', isLessThan: endDateTime)
      .get();

  transactions = query.docs.map((e) => Transactions.fromJson(e.data())).toList();
  return transactions;
}

// Usage example
final selectedDate = DateTime(parsed.year, parsed.month, parsed.day);  // Use the date part of DateTime

final newChartDataInc = await DashController.getChartData('Income', selectedDate);
final newChartDataEx = await DashController.getChartData('Expense', selectedDate);

print(newChartDataInc);
*/