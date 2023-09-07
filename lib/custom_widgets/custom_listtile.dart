import 'package:flutter/material.dart';
class listTile extends StatelessWidget {
  const listTile({required this.img,required this.text,required this.text1,
    Key? key}) : super(key: key);
  final String img;
  final String text;
  final String text1;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(height: 50,width: 50,
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(img),fit: BoxFit.cover))),
      title: Text(text,style: TextStyle(color: Colors.white,fontSize: 20,),),
      trailing: Icon(Icons.save_alt,color: Colors.white,),
      subtitle: Text(text1,style: TextStyle(color: Colors.white,fontSize: 10,)),
    );
  }
}
