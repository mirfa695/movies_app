import 'package:firebase_auth/firebase_auth.dart';

class LoginErrors {
  static String errorHandling(error) {
    switch (error.code) {
      case 'INVALID_LOGIN_CREDENTIALS':{return 'Invalid email/password';}
      case 'ERROR_USER_NOT_FOUND':{return 'email not found';}
      default:
        {
          return error.message;
        }
    }
  }
  static String registerError(error){
    switch(error.code){
      case 'email-already-in-use':{return 'Email exists';}
      default:{return error.message;}
    }
  }
}
