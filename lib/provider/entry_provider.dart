import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/utilities/Login_error.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/class_route_names.dart';
import '../services/firebase_auth_service.dart';

class EntryProvider extends ChangeNotifier {
  bool isLoading = false;
  SharedPreferences? preferences;
  Future<void> registerUser(
      String email, String password, BuildContext context) async {
    isLoading = true;
    try {

      await FirebaseAuthService().registerWithEmail(email, password, context);
      Navigator.pushNamed(context, RouteName.homeRoute);
      notifyListeners();
      isLoading = false;
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black,
          content: Center(
              child: Text(
            LoginErrors.registerError(e),
            style: TextStyle(fontSize: 18),
          ))));
    }
  }

  Future<void> signInUser(
      String email, String password, BuildContext context) async {
    isLoading = true;
    try {
      await FirebaseAuthService().signInWithEmail(email, password);
      await setBool(true);
      Navigator.pushNamed(context, RouteName.homeRoute);
      isLoading = false;
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black,
          content: Center(
              child: Text(LoginErrors.errorHandling(e),
                  style: TextStyle(fontSize: 18)))));
    }
  }

  Future<void> signOut(BuildContext context) async {
    isLoading = true;
    await FirebaseAuth.instance.signOut();
    await setBool(false);
    isLoading = false;
    Navigator.pushNamed(context, RouteName.loginRoute);
    notifyListeners();
  }

  Future<void> setBool(bool choice) async {
    preferences = await SharedPreferences.getInstance();
    await preferences?.setBool('IsLoggedIn', choice);
  }

  Future<void> signInWithgoogle(BuildContext context) async {
    isLoading = true;
    try {
      await FirebaseAuthService().googleSignIn1();
      isLoading = true;
      Navigator.pushNamed(context, RouteName.homeRoute);
      isLoading = false;
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black,
          content: Center(
              child: Text(e.toString(), style: TextStyle(fontSize: 18)))));
    }
  }

  Future sendOTP(String email, BuildContext context) async {
    try {
      await FirebaseAuthService().sendOtp(email);
      print('otp send');
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black,
          content: Center(
              child: Text(e.toString(), style: TextStyle(fontSize: 18)))));
    }
  }

  Future verifyEmail(String email, String otp, BuildContext context) async {
    try {
      await FirebaseAuthService().validate(email, otp);
      Navigator.pushNamed(context, RouteName.homeRoute);
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black,
          content: Center(
              child: Text(e.toString(), style: const TextStyle(fontSize: 18)))));
    }
  }
}
