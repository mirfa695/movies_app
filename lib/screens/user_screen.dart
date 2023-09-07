import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/avatar.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_text.dart';
import 'package:movies_app/screens/Navigation.dart';
import 'package:movies_app/screens/movie_list_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BgImage(
      wd: Container(
        color: Colors.black12.withOpacity(.6),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/img_1.png',height: 63,width:66,),
                Text(
                  'TREAMFLIX',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.red[900],fontSize: 24,fontWeight: FontWeight.w800),
                ),
              ],
            ),
            backgroundColor:Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               const CustomText(text: 'Who is watching?', size: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children:  [
                        InkWell(onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Navigation()),
                          );
                        },
                          child: const Avatar(size: 50,
                              img:
                                  'https://media.discordapp.net/attachments/1008571051392909393/1143952503549988974/allan_santamaria_Sensitive_Middle_man_seated_on_a_terrace_in_a__d9150e56-c0e9-416c-96d2-dd49f9839f5d.png?width=966&height=966'),
                        ),
                        const CustomText(text: 'User1', size: 18)
                      ],
                    ),
                    Column(
                      children: const [
                        Avatar(size: 50,
                            img:
                                'https://media.discordapp.net/attachments/1008571051392909393/1143958066140807298/cbs2023_82910_illustration_of_a_cow_with_a_mustache._childrens__2cdaffa0-f248-404a-ada2-435fbc3df52d.png?width=966&height=966'),
                        CustomText(text: 'User2', size: 18)
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        Avatar(size: 50,
                            img:
                                'https://media.discordapp.net/attachments/1008571051392909393/1143950354929701005/leajay_25364_witch_in_the_forest_with_a_black_cat_broom_crystal_7102fc5c-45a5-4e4a-b283-259eaf6411a9.png?width=966&height=966'),
                        CustomText(text: 'User3', size: 18)
                      ],
                    ),
                    Column(
                      children: const [
                        Avatar(size: 50,
                            img:
                                'https://media.discordapp.net/attachments/1008571051392909393/1143946087502188658/darianz_Compose_an_image_that_encapsulates_the_mid-journey_esse_7d2b9bed-01e1-4e22-af22-b1b6eb93a25d.png?width=966&height=966'),
                        CustomText(text: 'User4', size: 18)
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
