import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_Ebutton.dart';
import 'package:movies_app/custom_widgets/custom_listtile.dart';
import 'package:movies_app/custom_widgets/custom_text.dart';
import 'package:movies_app/screens/profile_screen.dart';

import '../custom_widgets/avatar.dart';

class SeriesPlay extends StatelessWidget {
  const SeriesPlay({Key? key}) : super(key: key);

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
        color: Colors.black.withOpacity(.3),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 90,left: 10.0,right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://www.hdwallpaper.nu/wp-content/uploads/2018/04/the_flash_2014-8.jpg'),
                          fit: BoxFit.cover)),
                ),
                const CustomText(text: 'Flash', size: 20),
                Row(
                  children: [
                    const CustomText(text: '2020', size: 15),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      color: Colors.black.withOpacity(.3),
                      child: const CustomText(text: 'U/A 13+', size: 15),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const CustomText(text: 'HD', size: 15),
                    const SizedBox(
                      width: 156,
                    ),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Wrap(
                                  children: const [
                                    ListTile(
                                      leading: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      title: CustomText(
                                        size: 12,
                                        text: 'My list',
                                      ),
                                      tileColor: Colors.black,
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      ),
                                      title: CustomText(
                                        size: 12,
                                        text: 'share',
                                      ),
                                      tileColor: Colors.black,
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.save_alt,
                                        color: Colors.white,
                                      ),
                                      title: CustomText(
                                        size: 12,
                                        text: 'All Episodes',
                                      ),
                                      tileColor: Colors.black,
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.more,
                          color: Colors.white,
                        ))
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/images/img_1.png',height: 31,width: 30,),
                    const Text(
                      'SERIES',
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, letterSpacing: 2),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Ebutton(
                    text: 'play',
                    clr: Colors.white,
                    clr2: Colors.black,
                    icon: Icons.play_arrow,
                    iconclr: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                const Ebutton(
                    text: 'Download S1:E1',
                    clr: Colors.black,
                    clr2: Colors.white,
                    icon: Icons.save_alt,
                    iconclr: Colors.white),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                    text:
                        "Since the inception of the character, DC’s The Scarlet Speedster appeared"
                        " in numerous forms of media, and in today’s post, we’re going to focus on live-action "
                        "movies that feature the fastest man alive. The Flash has been featured in several live-ac"
                        "tion moves, both standalone and as a part of a DCEU. So, let’s take a look at all Flash"
                        " movies (& characters’ appearances) in order.",
                    size: 13),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(text: 'Episodes', size: 20),
                const SizedBox(
                  height: 5,
                ),
                listTile(
                    img:
                        'https://tse3.mm.bing.net/th?id=OIP.44QRpy7h8WYBYlXzSW3v3QHaEK&pid=Api&P=0&h=180',
                    text: '1. The Call',
                    text1: '55m'),
                CustomText(
                    text:
                        'CSI investigator Barry Allen awakens from a coma, nine months after he was hit by lightning, and discovers he has superhuman speed',
                    size: 12),
                listTile(
                    img:
                        'https://tvseriesfinale.com/wp-content/uploads/2017/10/flash-cw-cancel-or-season-5-release-date-vulture-watch.jpg',
                    text: '2.Fastest man Alive',
                    text1: '54m'),
                CustomText(
                    text:
                        'arry takes on a group of armed men at an awards ceremony, but side effects from his new super power catch up with him.',
                    size: 12),
                listTile(
                    img:
                        'https://image.tmdb.org/t/p/w780/xwzqVmnMAFlcxwZdQzflewy3kb1.jpg',
                    text: '3.Things you cant outrun',
                    text1: '35m'),
                CustomText(text: 'Barry and Joe track a deadly metahuman with toxic gas powers, and Caitlin relives the night of the explosion that killed her fiancé.', size: 12),
                listTile(img: 'https://3.bp.blogspot.com/-j--67QKayHg/Xt0UFjEEHFI/AAAAAAAAATo/HHMQX0fyAmEtS-btuw9UZ73ZM7uAyfrVACLcBGAsYHQ/s1600/maxresdefault.jpg', text: 'Going Rougue', text1: '55m'),
                CustomText(text: 'To steal a priceless diamond, Captain Cold acquires a specialized gun that can slay the Flash. Joe disapproves of Eddie and Iris dating.', size: 12)
              ],
            ),
          ),
        ),
      )),
    );
  }
}
