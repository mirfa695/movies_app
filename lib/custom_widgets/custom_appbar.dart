import 'package:flutter/material.dart';
import 'package:movies_app/model_class/search_class.dart';
import 'package:movies_app/routes/class_route_names.dart';
import 'package:movies_app/utilities/dimensions.dart';
import 'avatar.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  @override
  final Size preferredSize;
   const CustomAppbar({Key? key}) : preferredSize = const Size.fromHeight(50.0),super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      leading: IconButton(onPressed: () {
        Navigator.pushNamed(context, RouteName.homeRoute);
      }, icon: const Icon(Icons.arrow_back),),
      title: Image.asset(
        'assets/images/img_1.png',
        height: Dimensions.customHeight(context, 24.6),
        width: Dimensions.customWidth(context, 11.25),
      ),
      actions: [
         IconButton(onPressed: () {
           showSearch(context: context, delegate: Search());
         }, icon:  Icon(Icons.search,size: Dimensions.customHeight(context, 24.6))),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouteName.profileRoute);
          },
          child:  Avatar(
              size: Dimensions.customHeight(context, 24.6),
              img:
              'https://media.discordapp.net/attachments/1008571051392909393/1143952503549988974/allan_santamaria_Sensitive_Middle_man_seated_on_a_terrace_in_a__d9150e56-c0e9-416c-96d2-dd49f9839f5d.png?width=966&height=966'),
        )
      ],
    );
  }
}
