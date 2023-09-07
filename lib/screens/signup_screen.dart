import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_Ebutton.dart';
import 'package:movies_app/custom_widgets/custom_text.dart';
import 'package:movies_app/custom_widgets/custom_textfield.dart';
import 'package:movies_app/screens/movie_list_screen.dart';
import 'package:movies_app/screens/user_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final userEditingController=TextEditingController();
  final passwordEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.transparent,
        body: BgImage(wd: Container(
          child: Center(
            child: Container(height: 400,width: 300,color: Colors.black.withOpacity(.6),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(text: 'Sign Up', size: 25),
                  const SizedBox(height: 30,),
                  CustomTextField(text: 'email', con: userEditingController, choice: false, no: 20),
                  const SizedBox(height: 10,),
                  CustomTextField(text: 'Password', con: passwordEditingController, choice: true, no: 20),
                  const SizedBox(height: 30,),
                  CustomTextField(text: 'Confirm Password', con: passwordEditingController, choice: true, no: 20),
                  const SizedBox(height: 30,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UserScreen()),
                    );
                  },style: ElevatedButton.styleFrom(backgroundColor: Colors.white.withOpacity(.7)), child: const Text('Sign Up'),),

                ],
              ),
            ),
          ),
        )
        ));
  }
}

