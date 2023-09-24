



class Moneyuser {  
  Moneyuser({ 
    required this.name , 
    //required this.email,
   // required this.id , 
    required this.expenses ,
    required this.income, 
    required this.balance
  }) ;
  late String name ;
 // late String email ; 
  //late String id ;  
  late double expenses ; 
  late double income ;
  late double balance ; 
  Moneyuser.fromJson(Map<String ,dynamic> json) {  
    name = json['name'] ; 
    //email =json['email'] ; 
    //id =json['id'] ; 
    expenses =json['expenses'] ; 
    income =json['income'] ; 
    balance = json['balance'] ;   
  }
Map<String,dynamic> tojson() {  
  final data =<String, dynamic>{} ; 
  data['name'] = name ; 
  //data['email'] =email ; 
  //data['id'] =id ; 
  data['expenses'] =expenses ; 
  data['income'] = income ; 
  data['balance'] = balance;  
  return data; 
}
 

}