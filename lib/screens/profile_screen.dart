import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/avatar.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_button.dart';
import 'package:movies_app/custom_widgets/custom_text.dart';

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
          padding: const EdgeInsets.only(top: 70.0, right: 20, left: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Avatar(
                          size: 30,
                          img:
                              'https://media.discordapp.net/attachments/1008571051392909393/1143952503549988974/allan_santamaria_Sensitive_Middle_man_seated_on_a_terrace_in_a__d9150e56-c0e9-416c-96d2-dd49f9839f5d.png?width=966&height=966'),
                      CustomText(text: 'User1', size: 15)
                    ],
                  ),
                  Column(
                    children: [
                      Avatar(
                          size: 30,
                          img:
                              'https://media.discordapp.net/attachments/1008571051392909393/1143958066140807298/cbs2023_82910_illustration_of_a_cow_with_a_mustache._childrens__2cdaffa0-f248-404a-ada2-435fbc3df52d.png?width=966&height=966'),
                      CustomText(text: 'User2', size: 15)
                    ],
                  ),
                  Column(
                    children: [
                      Avatar(
                          size: 30,
                          img:
                              'https://media.discordapp.net/attachments/1008571051392909393/1143950354929701005/leajay_25364_witch_in_the_forest_with_a_black_cat_broom_crystal_7102fc5c-45a5-4e4a-b283-259eaf6411a9.png?width=966&height=966'),
                      CustomText(text: 'User3', size: 15)
                    ],
                  ),
                  Column(
                    children: [
                      Avatar(
                          size: 30,
                          img:
                              'https://media.discordapp.net/attachments/1008571051392909393/1143946087502188658/darianz_Compose_an_image_that_encapsulates_the_mid-journey_esse_7d2b9bed-01e1-4e22-af22-b1b6eb93a25d.png?width=966&height=966'),
                      CustomText(text: 'User4', size: 15)
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.edit,color: Colors.white,),
                  CustomText(text: 'Manage Accounts', size: 25),
                ],
              ),
              const CustomButton(text: 'Notifications',icon: Icons.notifications,),
              const CustomButton(text: 'My List',icon: Icons.menu,),
              const CustomButton(text: 'App Seetings',icon: Icons.settings,),
              const CustomButton(text: 'Account',icon: Icons.account_circle,),
              const CustomButton(text: 'Help',icon: Icons.help,),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(.3)),
                child: const CustomText(
                  text: 'Sign out',
                  size: 15,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
