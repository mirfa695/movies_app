import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_textfield.dart';
import 'package:movies_app/provider/entry_provider.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
   OtpScreen({required this.email,required this.password,
     Key? key}) : super(key: key);
   String email;
   String password;
  TextEditingController otpcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(password);
    return Scaffold(
      body: BgImage(wd: Container(color: Colors.black.withOpacity(.6),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(text: 'OTP', con: otpcontroller, choice: false, no: 20),
            ElevatedButton(onPressed: () async {
              try{
               await context.read<EntryProvider>().verifyEmail(email, otpcontroller.text, context);
              await context.read<EntryProvider>().registerUser(email, password, context);}
                  catch(e){ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));}
            },style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(.7)), child: Text('verify'))
          ],
        ),)),
    );
  }
}
