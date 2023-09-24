
import 'package:flutter/material.dart';
import 'package:money_management_app/model/Transaction.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: camel_case_types, must_be_immutable
class CircularCard extends StatelessWidget {
  const CircularCard({
    super.key , 
     required this.titlechart , 
     required this.data
    });

  final String titlechart ;
  final List<Transactions> data;  
  //late TooltipBehavior _tooltipBehavior ;
 /* @override 
  void initState() {
    _chartdata = _getchartdata() ; 
_tooltipBehavior =TooltipBehavior(enable: true) ;
     super.initState() ;
  }*/
  @override
  Widget build(BuildContext context) { 
     return
       Padding(
         padding: const EdgeInsets.symmetric(vertical: 20),
         child: Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
             ) , 
            //shadowColor : const Color.fromARGB(255, 222, 124, 240) ,
            //color:const Color.fromARGB(255, 255, 255, 255),  
            elevation: 10,
           child: SfCircularChart(  
            title:ChartTitle(text: titlechart ) , 
            legend: const Legend(isVisible:true,overflowMode: LegendItemOverflowMode.wrap),
            //tooltipBehavior: _tooltipBehavior,
             series: <CircularSeries>[  
            PieSeries<Transactions,String>( 
              dataSource:  data, 
              xValueMapper: (Transactions data,_)=> data.expenseOrincome ,
             yValueMapper: (Transactions data,_)=> double.parse(data.amount) ,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              enableTooltip: true 
         
            
            )
         
         
         
         
               ],
         
               ),
         ),
       ) ;
     
     
  } 
}