import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_container.dart';
import 'package:movies_app/screens/series_play_screen.dart';

import '../custom_widgets/avatar.dart';

class TV_Shows extends StatelessWidget {
  const TV_Shows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: GridView.count(
          primary: false,
          padding: EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          childAspectRatio: (1 / 2),
          children:  [
            InkWell(onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SeriesPlay()),
              );
            },
              child: CustomContainer(
                  imagelink: 'https://picfiles.alphacoders.com/313/313453.jpg'),
            ),
            CustomContainer(
                imagelink:
                    'https://preview.redd.it/8gkj5vaggwg61.jpg?auto=webp&s=dbf5c3ac94564de0b6f489a3e4e77374ab2ebd26'),
            CustomContainer(
                imagelink: 'https://picfiles.alphacoders.com/106/106120.jpg'),
            CustomContainer(
                imagelink:
                    'https://image.tmdb.org/t/p/original/jvStfYRsDrcVymTEgRbyHqpBXwz.jpg'),
            CustomContainer(
                imagelink:
                    'https://www.themoviedb.org/t/p/original/2i5ax2loWSvIRyaGYrlEvh679N5.jpg'),
            CustomContainer(
                imagelink:
                    'https://www.themoviedb.org/t/p/original/yojyHxiIZq00XcFUujvXd2Jki4J.jpg'),
            CustomContainer(
                imagelink:
                    'http://images6.fanpop.com/image/photos/40100000/Riverdale-Poster-riverdale-2017-tv-series-40164994-2000-3000.jpg'),
            CustomContainer(
                imagelink:
                    'https://images.squarespace-cdn.com/content/v1/51b3dc8ee4b051b96ceb10de/1607377816225-JJRNDNH1MNNVM8LJYRUI/ke17ZwdGBToddI8pDm48kARuu2RycqeMwOQD-bqD7EV7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1Ucgw8MCLTjwCPRaicdDQD-xobHnrNvFwaaQDX1e5DI_QK19DM50qGfsFZg32uC5Iyw/EokkPB5U8AAkaJN.jpeg'),
            CustomContainer(
                imagelink:
                    'http://4.bp.blogspot.com/-HrjZF5ZwKdk/Uqbx-1ICgSI/AAAAAAAAABA/f1EKVpIHD9Q/s1600/The-Vampire-Diaries-2013-season-4-CW-poster.jpg')
          ],
        ),
      )),
    );
  }
}
