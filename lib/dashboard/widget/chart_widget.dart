/*import 'package:flutter/material.dart';
import 'package:money_management_app/model/Transaction.dart'; 
import 'package:syncfusion_flutter_charts/charts.dart'; 

 class Chart extends StatelessWidget {
 const Chart({ Key? key , 
 required this.title , 
 required this.trans , 
 required this.transate
 }) : super(key: key); 
  
final String title ; 
final List<Transactions> trans ; 
final String transate ;
  /*final List<DataChart> dataChart =[ 
     DataChart(DateTime(0,1,1) , 41.5),
     DataChart(DateTime(0,1,2) , 50.8) ,
     DataChart(DateTime(0,1,3) , 60.1),
     DataChart(DateTime(0,1,4) , 78.5), 
     DataChart(DateTime(0,1,5) , 100.5),
     DataChart(DateTime(0,1,6) , 120.5),
     DataChart(DateTime(0,1,7) , 135.6) ,
     DataChart(DateTime(0,1,8) , 137.8) ,
     DataChart(DateTime(0,1,9) , 145.5),
     DataChart(DateTime(0,1,10) , 122.5) ,
     DataChart(DateTime(0,1,11) , 108.5),
     DataChart(DateTime(0,1,12) , 52.5)
  ]  ;*/

  @override
  Widget build(BuildContext context) { 
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Card(  
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ) , 
         // shadowColor :const Color.fromARGB(255, 36, 170, 24) ,
          //color:const Color.fromARGB(255, 255, 255, 255),  
          elevation: 12,
            child: Column(
              children: [
                SfCartesianChart(  
                primaryXAxis: DateTimeAxis(
                 // intervalType: DateTimeIntervalType.hours
                 ), 
                  series:  <ChartSeries<Transactions, String>>[  
                  LineSeries<Transactions, String>
                (dataSource: trans , 
                 xValueMapper: (Transactions data, _)=> data.,
                 yValueMapper: (Transactions data ,_)=> double.parse(data.amount)
                 ) 
                     ],
                  ), 
                   Text(title)
              ],
            ),
      ),
    ) ;
    
  }
}

*/