import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/dashboard/dashcontroller/dashcontroller.dart';
import 'package:money_management_app/dashboard/widget/circular_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../model/Transaction.dart';

 class DashyYear extends StatefulWidget {
   const DashyYear({super.key}); 
  
  @override
  State<DashyYear> createState() => _DashyYearState();
}

class _DashyYearState extends State<DashyYear> { 
 @override
  void initState() {
     initData() ;
    super.initState();
  }
 late int date ; 
  
 Future<void> initData() async {  
  final  dateNow = DateTime.now() ;  
   final yearNow = dateNow.year;
  
   _circulardata  = await DashController.getCircularData( yearNow ,'year' ) ;  
   _chartdtaaInc = await DashController.getchartdata( 'Income' ,yearNow ,'year'  ) ;  
   _chartdtaaEx = await DashController.getchartdata('Expense' , yearNow ,'year' ) ; 

 }




   TextEditingController datecontroller = TextEditingController() ; 
   List<Transactions> _chartdtaaInc  =[] ;   
   List<Transactions> _chartdtaaEx  =[] ;      
   List<Transactions> _circulardata =[] ;
  //final parsed = DateFormat.yMMMd().parse(datecontroller.text).day;
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.vertical, 
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 50) , 
        child: Column(  
          children: [ 

       Center(
         child: Row( 
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox( 
                height: 60, 
                width: 150,
                child: TextFormField(  
                
               readOnly: true,
                  controller: datecontroller,  
                  decoration:  const InputDecoration(
                    icon: Icon(Icons.calendar_today_rounded) ,   
                    enabledBorder: OutlineInputBorder( 
                        borderRadius: BorderRadius.all(Radius.circular(13)) ,
                    
                      borderSide: BorderSide(
                        color: Colors.purple ,
                        width: 3
                      )
              
                    ), 
                    
                    iconColor: Colors.purple ,
                    labelText:  "select Date",
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13)) ,
                    
                    borderSide: BorderSide(
                      color:  Colors.purple  ,
                      width: 3
             
                      ) ,
                     ) ,  
                  ),
                   
                  onTap:() async {   
                      DateTime currentDate = DateTime.now();
                      DateTime? pickDate = await showDatePicker( 
                         context: context, 
                         initialDate: DateTime(currentDate.year , currentDate.month ,  currentDate.day ,currentDate.hour ,currentDate.minute  ),
                         firstDate: DateTime(currentDate.year - 10  ),
                         lastDate:  currentDate,
                    
                          );
                    if(pickDate !=null) {   
             
                    datecontroller.text =DateFormat.y().format(pickDate) ;   
                     date = DateFormat.y().parse(datecontroller.text).year ;
                    }
           
       
          
         })
              ), 
            const  SizedBox(width: 20) ,  
            InkWell(
              onTap: () async{
                   //final endate  =DateFormat.yMMMd().add_jm().parse() ;  

                     final newdataCircular  = await DashController.getCircularData( date ,'year' ) ;  
                     final newchartdataINC = await DashController.getchartdata( 'Income' , date ,'year'  ) ;  
                     final newchartdataEx = await DashController.getchartdata('Expense' ,date ,'year' ) ; 
                   //print(newchartdataINC) ;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                          setState(() {
                            _circulardata = newdataCircular; 
                            _chartdtaaInc =  newchartdataINC ;  
                            _chartdtaaEx = newchartdataEx ;
                          });
                        }) ;
              }, 
              child:  Container(  
              decoration: BoxDecoration( 
                borderRadius: BorderRadius.circular(20)  ,
                color: Colors.purple
                 ) , 
                child: const Padding(
                  padding: EdgeInsets.all(25),
                  child: Text(
                    'Load' , 
                    style:  TextStyle(
                      color: Colors.white ,
                
                    ),
                    
                    ),
                ), 
       
              
       
              ),
            )
              
           ],
         ),
       ),
            CircularCard(
              titlechart: ' Yaerly Incomes & Expenses',
                 data:_circulardata,
              ) , 



             Padding(
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
                   //tooltipBehavior: _tooltipBehavior1,
                primaryXAxis: DateTimeAxis(
                  
                  intervalType: DateTimeIntervalType.months
                ),
                  series:  <FastLineSeries<Transactions, DateTime>>[  
                  FastLineSeries<Transactions, DateTime>
                (dataSource: _chartdtaaEx, 
                 xValueMapper: (Transactions data, _)=>  DateFormat.M().parse(data.month.toString()) ,
                 yValueMapper: (Transactions data ,_)=> double.parse(data.amount)
                 ) 
                     ],
                  ), 
                  const  Text('Yearly Expenses')
              ],
            ),
      ),
    )  ,

    Padding(
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
                   //tooltipBehavior: _tooltipBehavior2,
                primaryXAxis: DateTimeAxis(
                intervalType: DateTimeIntervalType.days
                ),
                 // intervalType: DateTimeIntervalType.hours
                  
                  series:  <ChartSeries<Transactions, DateTime>>[  
                  LineSeries<Transactions, DateTime>
                (dataSource: _chartdtaaInc, 
                 xValueMapper: (Transactions data, _)=> DateFormat.M().parse(data.month.toString()) ,
                 yValueMapper: (Transactions data ,_)=> double.parse(data.amount)
                 ) 
                     ],
                  ), 
                 const   Text('Yearly Incomes')
              ],
            ),
      ),
    ) 
              
                
          ],
          

        ),
        ),
    ) ;
  }
}