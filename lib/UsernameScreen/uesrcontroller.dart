 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
 import 'package:flutter/material.dart';

import 'package:money_management_app/model/user.dart'; 
 FirebaseFirestore firestore = FirebaseFirestore.instance; 

class UsernameController extends GetxController   {
 final username =TextEditingController() ;  
 static String usernm= "" ; 

@override  
  void dispose() {
    username.dispose() ; 
    super.dispose() ;
  }


 
 Future<void> createuser()async{   
    
       usernm=username.text ;
  final usr = Moneyuser(
     name: usernm,
    
       expenses:0.0 ,
       income: 0.0,
        balance:0.0
        ) ;
    return  await firestore.
    collection('users').
    doc(usernm).
    set(usr.tojson()) ;

}  
 Future<bool> userExists() async {
  usernm=username.text ;
    return (await firestore.collection('users').doc(usernm).get()).exists;
  }



} 