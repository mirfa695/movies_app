import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_button.dart';
import 'package:movies_app/custom_widgets/custom_text.dart';
import 'package:movies_app/provider/entry_provider.dart';
import 'package:movies_app/utilities/dimensions.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BgImage(
          wd: Container(
        color: Colors.black.withOpacity(.6),
        child: Padding(
          padding:  EdgeInsets.only(top: Dimensions.customHeight(context, 10.5428), right: Dimensions.width20(context), left: Dimensions.width20(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               SizedBox(
                height: Dimensions.customHeight(context, 24.6),
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  CustomText(text: 'Manage Accounts', size: Dimensions.customHeight(context, 29.52)),
                ],
              ),
              const CustomButton(
                text: 'Notifications',
                icon: Icons.notifications,
              ),
              const CustomButton(
                text: 'My List',
                icon: Icons.menu,
              ),
              const CustomButton(
                text: 'App Seetings',
                icon: Icons.settings,
              ),
              const CustomButton(
                text: 'Account',
                icon: Icons.account_circle,
              ),
              const CustomButton(
                text: 'Help',
                icon: Icons.help,
              ),
               SizedBox(
                height: Dimensions.customHeight(context, 24.6),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<EntryProvider>().signOut(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(.3)),
                child:  CustomText(
                  text: 'Sign out',
                  size: Dimensions.height15(context),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
