import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/custom_tile.dart';
import 'package:movies_app/screens/profile_screen.dart';

import '../custom_widgets/avatar.dart';
import '../custom_widgets/bg_image.dart';
import '../custom_widgets/custom_text.dart';

class Downloads extends StatelessWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Image.asset(
            'assets/images/img_1.png',
            height: 50,
            width: 52,
          ),
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
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Column(

                children: [
                  Tile(
                      img:
                          'https://image.tmdb.org/t/p/original/yUa0iCocBPsGJ79BwrshHqz45Qc.jpg',
                      text: 'Interstellar',
                      text1: '13 |1.35GB',
                      img2: 'assets/images/img_4.png'),
                  SizedBox(height: 8,),
                  Tile(
                      img:
                          'https://images.hdqwalls.com/download/mortal-kombat-11-aftermath-game-8c-1336x768.jpg',
                      text: 'Mortal Kombat',
                      text1: '18 |1.75',
                      img2: 'assets/images/img_4.png'),
                  SizedBox(height: 80,),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 35.0,left: 35),
                        child: Container(
                          height: 210,
                          width: 210,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100)
                              //more than 50% of width makes circle
                              ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: Transform.rotate(
                            angle: -.3,
                            child: Container(
                              height: 180,
                              width: 120,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://imgix.ranker.com/user_node_img/4269/85376073/original/mulan-photo-u3?w=650&q=50&fm=pjpg&fit=fill&bg=fff'),
                                      fit: BoxFit.cover),borderRadius: BorderRadius.circular(20)
                              ),
                            )),
                      ),
                      Positioned(
                        right: 0,
                        child: Transform.rotate(
                            angle: .3,
                            child: Container( height: 180,
                              width: 120,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://i.redd.it/wmcj8ml7wqh01.jpg'),
                                      fit: BoxFit.cover),borderRadius: BorderRadius.circular(20)
                              ),
                            )
                            )),
                      Container( height: 190,
                        width: 130,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://i.pinimg.com/originals/c4/5c/97/c45c9707435f6dbf95ca47c9b24998dc.jpg'),
                                fit: BoxFit.cover),borderRadius: BorderRadius.circular(20)
                        ),
                      )
                    ],
                  ),
                  Container(padding: EdgeInsets.all(10),
                    color: Colors.black.withOpacity(.3),
                    child: CustomText(text: 'Find more to download', size: 15),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
