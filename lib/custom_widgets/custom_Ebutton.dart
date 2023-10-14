import 'package:flutter/material.dart';
import 'package:movies_app/provider/movie_details_provider.dart';
import 'package:movies_app/utilities/dimensions.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class Ebutton extends StatefulWidget {
   Ebutton({required this.text,required this.clr,required this.clr2,required this.icon,required this.iconclr,
    this.id,
    Key? key}) : super(key: key);
 final String text;
 final Color clr;
 final Color clr2;
 final IconData icon;
 final Color iconclr;
 String? id;

  @override
  State<Ebutton> createState() => _EbuttonState();
}

class _EbuttonState extends State<Ebutton> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,
      child: ElevatedButton(onPressed: () async{
       await context.read<MovieDetailsProvider>().getVideo(context, widget.id!);

       YoutubePlayerController _controller=YoutubePlayerController(initialVideoId:context.read<MovieDetailsProvider>().data!);

        showDialog(context: context, builder:(BuildContext context){
          return AlertDialog(content: Container(
            color: Colors.black,
            height: Dimensions.customHeight(context, 3.69),
            child: YoutubePlayer(controller:_controller,)
          ),
          );
       }

       );
      },style: ElevatedButton.styleFrom(backgroundColor: widget.clr), child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon,color: widget.iconclr,),
          SizedBox(width: Dimensions.customWidth(context, 18),),
          Text(widget.text,style: TextStyle(
            color: widget.clr2,fontSize: Dimensions.customHeight(context, 41)
          ),),
        ],
      ),),
    );
  }
}
