// ignore: file_names

class Transactions { 

Transactions({ 
  required this.expenseOrincome , 
  required this.transactionname , 
  required this.amount , 
  required this.time ,

  required this.month ,
  required this.day ,
  required this.year
}) ;

late  String  amount ;  
late  String  transactionname ;  
late  String expenseOrincome ;   
late  int day ; 
late  int  year ;
late  int  month ; 
late  String time;


  Transactions.fromJson(Map<String ,dynamic> json) {   
    amount = json['amount'] ; 
    expenseOrincome = json['expenseOrincome'] ; 
    transactionname = json['transactionname'] ; 
    year = json['year']  ;
    month = json['month'] ; 
    day = json['day'] ; 
    time =json['time'] ;

    

  } 
  Map<String ,dynamic> tojson() { 
    final data = <String ,dynamic> {} ; 
    data['amount'] =amount ; 
    data['expenseOrincome'] =expenseOrincome ; 
    data['transactionname'] = transactionname ;  
    data['time'] = time ;  
    data['day'] = day ; 
    data['month'] = month ; 
    data['year'] = year ; 

    
    return data ; 
  }






}