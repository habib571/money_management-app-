import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_management_app/Home/screen/HomeScreen.dart';


import '../../helper/dialogs.dart';
import '../../main.dart';
import '../controller/LoginController.dart';


//login screen -- implements google sign in or sign up feature for app
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnimate = false;

  @override
  void initState() {
    super.initState();

    //for auto triggering animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => _isAnimate = true);
    });
  }

  // handles google login button click
  _handleGoogleBtnClick() {
    //for showing progress bar
    showDialog(
        context: context,
        builder: (_) => const Center(child: CircularProgressIndicator()));

    _signInWithGoogle().then((user) async {
      //for hiding progress bar
      Navigator.pop(context);

      if (user != null) {
        log('\nUser: ${user.user}');
        log('\nUserAdditionalInfo: ${user.additionalUserInfo}');

        if ((await AuthController.userExists())) {
            Get.to(()=> const HomeScreen()) ;
        } else {
             await AuthController.createuser().then((value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          });
        }
        }
      } );
    
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await AuthController.firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      log('\n_signInWithGoogle: $e');
      Dialogs.showSnackbar(context, 'Something Went Wrong (Check Internet!)');
      return null;
    }
  }

  //sign out function
  // _signOut() async {
  //   await FirebaseAuth.instance.signOut();
  //   await GoogleSignIn().signOut();
  // }

  @override
  Widget build(BuildContext context) {
    //initializing media query (for getting device screen size)
     mq = MediaQuery.of(context).size;

    return Scaffold(
     backgroundColor: Colors.white,
      

      //body
      body: Stack(children: [
        //app logo
        AnimatedPositioned(
            top: mq.height * .15,
            right: _isAnimate ? mq.width * .10 : -mq.width * .5,
            width: mq.width * .8,
            duration: const Duration(seconds: 1),
            child: Column(
              children: [
                Image.asset('images/saving.png'), 
               const SizedBox(height: 30,) , 
               const Text('Save Your Money !' ,style: TextStyle(fontSize: 27 , color: Colors.deepPurple),) ,

              ],
            )), 
            //Text('Save Your Money !' ,style: TextStyle(fontSize: 27),) ,

        //google login button
        Positioned(
            bottom: mq.height * .15,
            left: mq.width * .05,
            width: mq.width * .9,
            height: mq.height * .06,
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor:  Colors.purple ,
                    shape: const StadiumBorder(),
                    elevation: 1),
                onPressed: () {
                  _handleGoogleBtnClick();
                },

                //google icon
                icon: Image.asset('images/google.png', height: mq.height * .03),

                //login with google label
                label: RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      children: [
                        TextSpan(text: 'Login with '),
                        TextSpan(
                            text: 'Google',
                            style: TextStyle(fontWeight: FontWeight.w500 ,color: Colors.white)),
                      ]),
                ))),
      ]),
    );
  }
}