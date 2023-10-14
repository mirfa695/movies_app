import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_text.dart';
import 'package:movies_app/custom_widgets/custom_textfield.dart';
import 'package:movies_app/provider/entry_provider.dart';
import 'package:movies_app/routes/class_route_names.dart';
import 'package:movies_app/routes/class_routes.dart';
import 'package:movies_app/screens/entry/otp_screen.dart';
import 'package:movies_app/utilities/dimensions.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final userEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final cPasswordEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: BgImage(
            wd: Center(
              child: Container(
                height: Dimensions.customHeight(context, 1.476),
                width: Dimensions.customWidth(context, 1.2),
                color: Colors.black.withOpacity(.6),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       CustomText(text: 'Sign Up', size: Dimensions.customHeight(context, 29.52)),
                       SizedBox(
                        height: Dimensions.customHeight(context, 24.6),
                      ),
                      CustomTextField(
                        text: 'email',
                        con: userEditingController,
                        choice: false,
                        no: 20,
                        val: (value) {
                          if (value == null ||
                              !value.contains('@') ||
                              !value.endsWith('.com')) {
                            return 'Enter valid email';
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
                        choice: false,
                        no: 20,
                        val: (value) {
                          if (value == null || value.length < 8) {
                            return 'Password must be grater than 8';
                          }
                          return null;
                        },
                      ),
                       SizedBox(
                        height: Dimensions.height10(context),
                      ),
                      CustomTextField(
                        text: 'Confirm Password',
                        con: cPasswordEditingController,
                        choice: true,
                        no: 20,
                        val: (value) {
                          if (value != passwordEditingController.text) {
                            return 'Password must be same';
                          }
                          return null;
                        },
                      ),
                       SizedBox(
                        height: Dimensions.customHeight(context, 24.6),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // await context.read<EntryProvider>().registerUser(
                            //     userEditingController.text,
                            //     passwordEditingController.text,
                            //     context);
                            await context.read<EntryProvider>().sendOTP(userEditingController.text, context);
                            Navigator.pushNamed(context, RouteName.otpRoute,arguments: ScreenArguments(userEditingController.text, passwordEditingController.text));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(.7)),
                        child:context.watch<EntryProvider>().isLoading?const CircularProgressIndicator(color: Colors.white,): const Text('Sign Up'),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
