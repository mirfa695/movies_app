import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/avatar.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_container.dart';
import 'package:movies_app/custom_widgets/custom_text.dart';
import 'package:movies_app/screens/catogories_screen.dart';
import 'package:movies_app/screens/movie_play_screen.dart';
import 'package:movies_app/screens/movies_screen.dart';
import 'package:movies_app/screens/profile_screen.dart';
import 'package:movies_app/screens/tv_shows_screen.dart';

class MovieList_Screen extends StatelessWidget {
  const MovieList_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Image.asset('assets/images/img_1.png',height: 50,width: 52,),
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
        color: Colors.black.withOpacity(.6),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 90.0),
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 400,
                    width: 330,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://wallup.net/wp-content/uploads/2019/07/24/748894-spider-man-superhero-marvel-spider-man-action-spiderman-poster.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                      top: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Movie_Screen()),
                                );
                              },
                              child: const CustomText(text: 'Movies', size: 15)),
                          const SizedBox(
                            width: 40,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const TV_Shows()),
                                );
                              },
                              child:
                                  const CustomText(text: 'TV Shows', size: 15)),
                          const SizedBox(
                            width: 40,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Categories()),
                                );
                              },
                              child:
                                  const CustomText(text: 'Categories', size: 15)),
                        ],
                      )),
                  Positioned(
                      bottom: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          const Icon(
                            Icons.bookmark,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MoviePlay()),
                              );
                            },
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
                                  style: TextStyle(color: Colors.black,fontFamily: 'Inter',fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          const Icon(
                            Icons.download_for_offline_rounded,
                            color: Colors.white,
                          )
                        ],
                      ))
                ]),
                const SizedBox(
                  width: 20,
                ),
                Align(alignment:Alignment.topLeft,
                    child: const CustomText(text: 'Trending Now', size: 20)),
                SizedBox(height: 7,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CustomContainer(
                        imagelink:
                            'https://www.mygeekconfessions.com/wp-content/uploads/2017/11/Coco-Movie-Poster.jpg'),
                    CustomContainer(
                        imagelink:
                            'https://www.newdvdreleasedates.com/images/posters/large/rrr-2022-09.jpg'),
                    CustomContainer(
                        imagelink:
                            'https://image.tmdb.org/t/p/original/rQpd7eMhzQxCF90c8ITNqZDFCQu.jpg')
                  ],
                ),
              ],
            ),
          ),
        ),
      )
      ),
    );
  }
}
