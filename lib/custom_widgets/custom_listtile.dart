import 'package:flutter/material.dart';
import 'package:movies_app/utilities/dimensions.dart';
class listTile extends StatelessWidget {
  const listTile({required this.img,required this.text,required this.text1,
    Key? key}) : super(key: key);
  final String img;
  final String text;
  final String text1;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(height: Dimensions.customHeight(context, 14.76),width: Dimensions.customWidth(context, 7.2),
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(img),fit: BoxFit.cover))),
      title: Text(text,style: TextStyle(color: Colors.white,fontSize: Dimensions.customHeight(context, 36.9),),),
      trailing: Icon(Icons.save_alt,color: Colors.white,),
      subtitle: Text(text1,style: TextStyle(color: Colors.white,fontSize: Dimensions.height10(context))),
    );
  }
}
