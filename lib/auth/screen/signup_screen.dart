
/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

import '../../UsernameScreen/username_butt.dart';
import '../controller/LoginController.dart';
import '../widget/auth/emailField.dart';
import '../widget/auth/passwordFiled.dart'; 


class Signup extends StatefulWidget {
  const Signup({Key? key , 
     }):super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {  
 final TextEditingController usernameC =TextEditingController() ;
  
   final TextEditingController emailC = TextEditingController();
   final TextEditingController passwordC = TextEditingController();
   final TextEditingController passwordConfirmC = TextEditingController(); 
   @override
   void dispose() { 
    emailC.dispose() ;
    passwordC.dispose() ;
    passwordConfirmC.dispose() ; 
   
  
    super.dispose(); 
    
   }
  bool passwordVisibility = true;   
  

  
  @override
  Widget build(BuildContext context) { 
  
   
    return Scaffold(   
      appBar: AppBar( 
        backgroundColor: Colors.white,  
       
        title: const Text('Sign Up' ,style: TextStyle(fontSize: 25 ,color: Colors.black ,fontWeight: FontWeight.bold)), 
        centerTitle: true, 
        leading: 
          IconButton(
                    onPressed: () {  
                
                    },  
                            icon: const Image(
                              width: 24,
                              color: Colors.black,
                              image: AssetImage("images/saving.png"),
                     
                     )), 
        
      ),
      
      body:  
      
        SafeArea(  
        
        child: SingleChildScrollView(
  
          child:  Padding(
              padding:  const EdgeInsets.symmetric( 
                horizontal: 30
              ) , 
              child: Column(  
              
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [     

                  const SizedBox(height: 30,) ,
                  
               const   Center(child:
                    
                  Text( 
                    "Welcome Back !" ,
                    style: TextStyle( 
                      fontSize: 30 , 
                      color: Colors.black ,  
                      
                      
                    ), 
                    textAlign: TextAlign.center,
                    )) ,
                    const SizedBox( 
                      height: 20,
                    ), 
                    const  Text( 
                    "Sign Up with Email AND password!\nOr continue With Social Media" ,
                    style: TextStyle( 
                      fontSize: 20 , 
                      color: Colors.grey , 
                      
                    ), 
                    textAlign: TextAlign.center,
                    ) ,  
                   const SizedBox(height: 50,),
 
                         MyTextField( 
                          label: "E-mail",
                          hintText: 'Enter your email',
                           inputText: TextInputType.emailAddress,
                            textEditingController: emailC
                            ), 
                          const  SizedBox(  
                            height: 20,
                          ), 
                        Mypasswordfield( 
                          label: 'Password',
                          hintText: 'Enter your password', 
                          isPasswordVisible: passwordVisibility,
                          ontap: () {  setState(() {
                            passwordVisibility = !passwordVisibility ;
                          });
                          
                          },
                            textEditingController: passwordC
                            ),
                           const SizedBox( 
                              height: 20,
                            ), 
                              Mypasswordfield( 
                                label: 'confirm your password',
                          hintText: 'confirm your password', 
                          isPasswordVisible: passwordVisibility,
                          ontap: () { 

                            setState(() {
                            passwordVisibility = ! passwordVisibility ;
                            });
                          },
                            textEditingController: passwordConfirmC
                            ), 
                          const SizedBox(height: 40) ,
                          MyTextButton(
                            buttonName: 'Sign Up', 
                             ontap: (){
                                        
                             _signUp() ;

                             }, 
                             textcolor:Colors.white, 
                             bgcolor:Colors.blue
                             )




                          




                ],


              ),

            
              )
          
        ),

       ),


       );
   
    
  } 
  _signUp() async {
    var email = emailC.text.trim();
    var pw = passwordC.text.trim();
    var pwConfirm = passwordConfirmC.text.trim();    
    var usern = usernameC.text.trim() ;
    
     

    if (email.isEmpty || pw.isEmpty || pw != pwConfirm || usern.isEmail) {
      await showOkAlertDialog(
        context: context,
        message: 'Check your email or password',
      );
      return;
    }

    var obj = await AuthController.signUp(email, pw);

    if (obj is User) {
     Get.to(()=>const Signup()) ;
    } else {
      // ignore: use_build_context_synchronously
       showOkAlertDialog(
        context: context,
        message: obj,
      );
    }
  } 
  
  
}
*/