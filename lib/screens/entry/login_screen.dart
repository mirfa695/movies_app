import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_text.dart';
import 'package:movies_app/custom_widgets/custom_textfield.dart';
import 'package:movies_app/provider/entry_provider.dart';
import 'package:movies_app/utilities/dimensions.dart';
import 'package:provider/provider.dart';

import '../../routes/class_route_names.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final userEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: BgImage(
            wd: Center(
              child: Container(
                height: Dimensions.customHeight(context, 1.845),
                width: Dimensions.customWidth(context, 1.2),
                color: Colors.black.withOpacity(.6),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       CustomText(text: 'Login', size: Dimensions.customHeight(context, 29.52)),
                       SizedBox(
                        height: Dimensions.customHeight(context, 24.6),
                      ),
                      CustomTextField(
                        text: 'email',
                        con: userEditingController,
                        choice: false,
                        no: Dimensions.customHeight(context, 369),
                        val: (value) {
                          if (value == null ||
                              !value.contains('@') ||
                              !value.endsWith('.com')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                       SizedBox(
                        height: Dimensions.height10(context),
                      ),
                      CustomTextField(
                        text: 'Password',
                        con: passwordEditingController,
                        choice: true,
                        no: Dimensions.customHeight(context, 369),
                        val: (value) {
                          if (value == null || value.length < 8) {
                            return 'Password must be greater than 8';
                          }
                          return null;
                        },
                      ),
                       SizedBox(
                        height: Dimensions.customHeight(context, 24.6),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                           context.read<EntryProvider>().signInUser(userEditingController.text, passwordEditingController.text, context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(.7)),
                        child:context.watch<EntryProvider>().isLoading?const CircularProgressIndicator(color: Colors.white,): const Text('Login'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            "Don't you have an account?",
                            style: TextStyle(color: Colors.grey, fontSize: Dimensions.customHeight(context, 73.8)),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteName.registerRoute);
                              },
                              child:  CustomText(text: 'Sign up', size: Dimensions.customHeight(context, 67))),
                        ],
                      ),
                      SizedBox(height: Dimensions.height10(context),),
                      CustomText(text: 'OR', size: 15),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text(
                          "Sign in with goole",
                          style: TextStyle(color: Colors.grey, fontSize: Dimensions.customHeight(context, 73.8)),
                        ),
                        SizedBox(width: Dimensions.customWidth(context, 72)),
                        InkWell(onTap: ()async{
                         await context.read<EntryProvider>().signInWithgoogle(context);
                        },
                            child: const CircleAvatar(backgroundImage: NetworkImage('https://play-lh.googleusercontent.com/aFWiT2lTa9CYBpyPjfgfNHd0r5puwKRGj2rHpdPTNrz2N9LXgN_MbLjePd1OTc0E8Rl1=w240-h480-rw'),radius: 20,))
                      ],)
                    ],
                  ),
                ),
              ),
            )));
  }
}
