import 'package:flutter/material.dart';
class Ebutton extends StatelessWidget {
  const Ebutton({required this.text,required this.clr,required this.clr2,required this.icon,required this.iconclr,
    Key? key}) : super(key: key);
 final String text;
 final Color clr;
 final Color clr2;
 final IconData icon;
 final Color iconclr;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,
      child: ElevatedButton(onPressed: (){}, child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,color: iconclr,),
          SizedBox(width: 20,),
          Text(text,style: TextStyle(
            color: clr2,fontSize: 18
          ),),
        ],
      ),style: ElevatedButton.styleFrom(backgroundColor: clr),),
    );
  }
}
