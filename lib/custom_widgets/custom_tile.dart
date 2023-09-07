import 'package:flutter/material.dart';
class Tile extends StatelessWidget {
  const Tile({required this.img,required this.text,required this.text1,required this.img2,
    Key? key}) : super(key: key);
  final String img;
  final String text;
  final String text1;
  final String img2;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(height: 90,width: 100,
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(img),fit: BoxFit.cover))),
      title: Text(text,style: TextStyle(color: Colors.white,fontSize: 20,),),
      trailing: Image.asset(img2,height: 50,width: 50,),
      subtitle: Text(text1,style: TextStyle(color: Colors.white,fontSize: 10,)),
    );
  }
}
