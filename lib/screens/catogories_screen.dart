import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_categories.dart';

import '../custom_widgets/avatar.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

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
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: GridView.count(
                primary: false,
                padding: EdgeInsets.all(10),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: (1 / 2),
                children:  const [
                  CustomCategories(imagelink: 'https://wallpaperaccess.com/full/3075771.jpg', text: 'Comedy'),
                  CustomCategories(imagelink: 'https://tse4.mm.bing.net/th?id=OIP.JoVULmri1lPQQoOUh58LxwHaEK&pid=Api&P=0&h=180', text: 'Romance'),
                  CustomCategories(imagelink: 'https://otakukart.com/wp-content/uploads/2020/09/cropped-1366-768-1069781.jpg', text: 'Thriller'),
                  CustomCategories(imagelink: 'https://wallpapercave.com/wp/wp6955438.jpg', text: 'Animation'),
                  CustomCategories(imagelink: 'http://4.bp.blogspot.com/-EIIMiZvK3x8/VjxLOFTmXhI/AAAAAAAADTw/6Xp_JtUJYEw/s1600/free-download-amazing-high-resolution-wallpapers-of-bollywood-movies-wonderful-poster-of-indian-movie-krrish-3.jpg', text: 'Super Hero'),
                 CustomCategories(imagelink: 'https://tse1.mm.bing.net/th?id=OIP.3zxvejXFjuyc5eg48iisQQHaEK&pid=Api&P=0&h=180', text: 'Horror')
                 ,CustomCategories(imagelink: 'https://tse4.mm.bing.net/th?id=OIP.pR6ka7ZSt7MzfwY1eT56JQHaEK&pid=Api&P=0&h=180', text: 'Marvels'),
                  CustomCategories(imagelink: 'https://moviegalleri.net/wp-content/gallery/gandeevadhari-arjuna/thumbs/thumbs_Varun-Tej-Gandeevadhari-Arjuna-Movie-HD-Images.jpg', text: 'Actions')
                ],
              ),
            ),
          )),
    );
  }
}
