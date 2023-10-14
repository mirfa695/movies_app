import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/utilities/Login_error.dart';

class FirebaseAuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  EmailAuth emailAuth =  EmailAuth(sessionName: "Sample session");
  Future<UserCredential> registerWithEmail(String email,String password,BuildContext context)async{
     final result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
    if(result.user!=null){
      return result;
    }
    else{
      throw LoginErrors.registerError(result);
    }

  }
  Future<UserCredential> signInWithEmail(String email,String password)async{
   final user= await _auth.signInWithEmailAndPassword(email: email, password: password);
   if(user.user!=null){
     return user;
   }
   else{
     throw LoginErrors.errorHandling(user);
   }
  }
  Future googleSignIn1()async{
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    print(googleUser);

    if (googleUser != null) {
      print('skdfsd');
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );return credential;

    //   final UserCredential userCredential =
    //   await FirebaseAuth.instance.signInWithCredential(credential);
    //   return userCredential;

  //}
  }}
  Future<bool> sendOtp(String email)async{
    var sotp=await emailAuth.sendOtp(recipientMail: email,otpLength: 5);
    return sotp;
  }
  Future<bool> validate(String email,String otp)async{
    var data=await emailAuth.validateOtp(recipientMail: email, userOtp: otp);
    return data;
  }
}