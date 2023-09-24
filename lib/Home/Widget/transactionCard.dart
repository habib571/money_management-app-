import 'package:flutter/material.dart'; 


class MyTransaction extends StatelessWidget {
final String trans ; 
final String transname ;
final Color transcolor ; 
final String datetime ;

  const MyTransaction({super.key, 
    required this.trans ,
    required this.transname ,
    required this.transcolor , 
    required this.datetime
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(10),
         
          decoration:  BoxDecoration(
                  color: Colors.white , 
            boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade800,
                  offset: const Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
             const  BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
 
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey[800]),
                    child:const Center(
                      child: Icon(
                        Icons.attach_money_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                 const SizedBox(
                    width: 7,
                  ),
                  Text(transname,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ))]),
                      //const SizedBox(width:30) ,
                     Center(
                      child: Text(datetime ),
                     ) ,
                
              
              Text( 
                 trans ,
               // '${transaction.expenseOrincome == 'expense' ? '-' : '+'}\$${transaction.amount}',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color:transcolor 
                      
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
