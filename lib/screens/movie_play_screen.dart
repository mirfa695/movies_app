import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_Ebutton.dart';
import 'package:movies_app/custom_widgets/custom_container.dart';
import 'package:movies_app/custom_widgets/custom_text.dart';
import 'package:movies_app/screens/profile_screen.dart';

import '../custom_widgets/avatar.dart';

class MoviePlay extends StatelessWidget {
  const MoviePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title:Image.asset('assets/images/img_1.png',height: 50,width: 52,),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          const Icon(Icons.search),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
            child: const Avatar(
                size: 50,
                img:
                    'https://media.discordapp.net/attachments/1008571051392909393/1143952503549988974/allan_santamaria_Sensitive_Middle_man_seated_on_a_terrace_in_a__d9150e56-c0e9-416c-96d2-dd49f9839f5d.png?width=966&height=966'),
          )
        ],
      ),
      body: BgImage(
          wd: Container(
        color: Colors.black.withOpacity(.3),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 90.0,right: 10,left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'http://www.pixelstalk.net/wp-content/uploads/2016/08/Free-Download-Spiderman-Wallpaper.jpeg'),fit: BoxFit.cover)),
                    ),
                    Positioned(bottom: 0,
                      child: Row(
                        children: [
                          Container(padding: EdgeInsets.all(10),
                            color: Colors.black.withOpacity(.3),
                            child: CustomText(text: 'preview', size: 15),
                          ),
                          SizedBox(width: 200,),
                          Container(padding: EdgeInsets.all(10),
                            color: Colors.black.withOpacity(.1),
                            child: CustomText(text: '10:02', size: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CustomText(text: 'Spider Man 2', size: 20),
                Row(
                  children: [
                    CustomText(text: '2023', size: 15),
                    SizedBox(width: 10,),
                    Container(
                      color: Colors.black.withOpacity(.3),
                      child: CustomText(text: 'U/A 18+', size: 15),
                    ),
                    SizedBox(width: 10,),
                    Image.asset('assets/images/hd.png',height: 20,width: 20,),
                    SizedBox(width: 10,),
                    Image.asset('assets/images/img_2.png',height: 20,width: 20,),
                    SizedBox(width: 10,),
                    Image.asset('assets/images/img_3.png',height: 20,width: 20,),
                    SizedBox(width: 95,),
                    IconButton(onPressed: (){
                      showModalBottomSheet(context: context, builder:(context){
                        return Wrap(
                          children: [
                            ListTile(
                              leading:Icon(Icons.add,color: Colors.white,)
                              ,title: CustomText(size: 12,text: 'My list',),
                              tileColor: Colors.black,
                            ),
                            ListTile(
                              leading:Icon(Icons.share,color: Colors.white,)
                              ,title: CustomText(size: 12,text: 'share',),
                              tileColor: Colors.black,
                            ),
                            ListTile(
                              leading:Icon(Icons.save_alt,color: Colors.white,)
                              ,title:  CustomText(size: 12,text: 'All Episodes',),
                              tileColor: Colors.black,
                            ),

                          ],
                        );
                      });
                    }, icon: Icon(Icons.more,color: Colors.white,))
                  ],
                ),
                Row(
                  children: [
                  Image.asset('assets/images/img_1.png',height: 31,width: 30,),
              Text('MOVIE',style: TextStyle(color: Colors.white,fontSize: 15,letterSpacing: 2),)
                  ],
                ),
                SizedBox(height: 10,),
                Ebutton(text: 'play', clr: Colors.white, clr2: Colors.black, icon: Icons.play_arrow, iconclr: Colors.black),
                SizedBox(height: 5,),
                Ebutton(text: 'Download', clr: Colors.black, clr2: Colors.white, icon: Icons.save_alt, iconclr: Colors.white),
             SizedBox(height: 10,),
                CustomText(text: "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. "
                    "When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter "
                    "to discover what it truly means to be Spider-Man", size: 13),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Column(
                    children: [
                      Icon(Icons.add,color: Colors.white,size: 30,),
                      CustomText(text: 'My List', size: 10),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.share,color: Colors.white,size: 30,),
                      CustomText(text: 'Share', size: 10),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.save_alt,color: Colors.white,size: 30,),
                      CustomText(text: 'Download', size: 10),
                    ],
                  ),
                ],),
                SizedBox(height: 7,),
                Align(alignment: Alignment.topLeft,
                    child: CustomText(text: 'More like this', size: 20)),
                SizedBox(height: 5,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomContainer(imagelink: 'https://www.movienewsletters.net/photos/316709R1.jpg'),
                    CustomContainer(imagelink: 'http://www.impawards.com/2018/posters/avengers_infinity_war_ver2.jpg'),
                    CustomContainer(imagelink: 'http://www.impawards.com/2021/posters/shangchi_and_the_legend_of_the_ten_rings_ver2.jpg')
                  ],
                )
              ],

            ),
          ),
        ),
      )),
    );
  }
}
