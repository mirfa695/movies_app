import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/avatar.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_container.dart';
import 'package:movies_app/custom_widgets/custom_text.dart';
import 'package:movies_app/screens/tv_shows_screen.dart';

class Movie_Screen extends StatelessWidget {
  const Movie_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Image.asset('assets/images/img_1.png',height: 50,width: 52,),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Icon(Icons.search),
          Avatar(
              size: 30,
              img:
                  'https://media.discordapp.net/attachments/1008571051392909393/1143952503549988974/allan_santamaria_Sensitive_Middle_man_seated_on_a_terrace_in_a__d9150e56-c0e9-416c-96d2-dd49f9839f5d.png?width=966&height=966')
        ],
      ),
      body: BgImage(
          wd: Container(
        color: Colors.black.withOpacity(.6),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 400,
                    width: 330,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://i.pinimg.com/736x/69/f1/2e/69f12e0448a3080c8f595e4a78f4e2d0.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                      top: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          const CustomText(text: 'Movies', size: 15),
                          const SizedBox(
                            width: 40,
                          ),
                          InkWell(
                              onTap: () {},
                              child: const CustomText(text: 'Categories', size: 15))
                        ],
                      )),
                  Positioned(
                      bottom: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          const Icon(
                            Icons.save_alt,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Play now',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          const Icon(
                            Icons.data_saver_on_sharp,
                            color: Colors.white,
                          )
                        ],
                      ))
                ]),
                const SizedBox(
                  width: 30,
                ),
                const CustomText(text: 'Indian Movies', size: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CustomContainer(
                        imagelink:
                            'https://www.cinejosh.com/newsimg/newsmainimg/bahubali-2-movie-poster_b_1004180405.jpg'),
                    CustomContainer(
                        imagelink:
                            'https://i.pinimg.com/originals/bb/2c/e1/bb2ce1f969517b07be05780a165f6647.jpg'),
                    CustomContainer(
                        imagelink:
                            'https://i1.wp.com/www.socialnews.xyz/wp-content/uploads/2018/11/06/KGF-Movie-Hindi-poster-.jpg?quality=90&zoom=1&ssl=1')
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
