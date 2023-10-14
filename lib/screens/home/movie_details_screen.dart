import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_Ebutton.dart';
import 'package:movies_app/custom_widgets/custom_appbar.dart';
import 'package:movies_app/custom_widgets/custom_gridview.dart';
import 'package:movies_app/custom_widgets/custom_text.dart';
import 'package:movies_app/model_class/details_class.dart';
import 'package:movies_app/model_class/sqlite_data_class.dart';
import 'package:movies_app/provider/movie_details_provider.dart';
import 'package:movies_app/provider/similiar_shows_provider.dart';
import 'package:movies_app/utilities/api_constants.dart';
import 'package:movies_app/utilities/dimensions.dart';
import 'package:provider/provider.dart';


class MovieDetails extends StatelessWidget {
   MovieDetails({
   this.details,
    Key? key}) : super(key: key);
  Details? details;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: CustomAppbar(),
      body: BgImage(
          wd: Container(
            color: Colors.black.withOpacity(.3),
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.only(top: Dimensions.customHeight(context, 8.2), left: Dimensions.customWidth(context, 36), right: Dimensions.customWidth(context, 36)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      details?.backdropPath == null  ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyMG5Hj05J34kUvHStqq1zdC3Ym79ItDplK-Gsagk&sh" :ApiConstants.imageUrl+details!.backdropPath!,
                      errorBuilder: (context, error, stackTrace){
                                    return  CustomText(text: 'Network Error', size: Dimensions.customHeight(context, 29.52));
                    },),
                     Align(alignment: Alignment.topLeft,
                         child: CustomText(text: details?.title??'no title', size: Dimensions.customHeight(context, 36.9))),
                    Row(
                      children: [
                         CustomText(text: details?.releaseDate??'Unknown', size: Dimensions.height15(context)),
                         SizedBox(
                          width: Dimensions.width10(context),
                        ),
                        Container(
                          color: Colors.black.withOpacity(.3),
                          child:  CustomText(text: 'U/A 13+', size: Dimensions.height15(context)),
                        ),
                         SizedBox(
                          width: Dimensions.width10(context),
                        ),
                         CustomText(text: 'HD', size: Dimensions.height15(context)),
                       const Spacer(),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return  Wrap(
                                      children: [
                                        ListTile(
                                          leading: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          title: CustomText(
                                            size: Dimensions.customHeight(context, 61.5),
                                            text: 'My list',
                                          ),
                                          tileColor: Colors.black,
                                        ),
                                        ListTile(
                                          leading: const Icon(
                                            Icons.share,
                                            color: Colors.white,
                                          ),
                                          title: CustomText(
                                            size: Dimensions.customHeight(context, 61.5),
                                            text: 'share',
                                          ),
                                          tileColor: Colors.black,
                                        ),
                                        ListTile(
                                          leading: const Icon(
                                            Icons.save_alt,
                                            color: Colors.white,
                                          ),
                                          title: CustomText(
                                            size: Dimensions.customHeight(context, 61.5),
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
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children:
                        List.generate(10, (index) {
                          return Icon(
                            index < details?.voteAverage.toInt() ? Icons.star : Icons.star_border,color: Colors.yellow,
                          );
                        })
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/img_1.png',
                          height: Dimensions.customHeight(context, 23.8),
                          width: Dimensions.customWidth(context, 12),
                        ),
                         Text(
                          'MOVIES',
                          style: TextStyle(
                              color: Colors.white, fontSize: Dimensions.height15(context), letterSpacing: 2),
                        )
                      ],
                    ),
                     SizedBox(
                      height: Dimensions.height10(context),
                    ),
                     Ebutton(
                       id: details?.id.toString(),
                        text: 'play',
                        clr: Colors.white,
                        clr2: Colors.black,
                        icon: Icons.play_arrow,
                        iconclr: Colors.black),
                     SizedBox(
                      height: Dimensions.customHeight(context, 147.6),
                    ),
                      SizedBox(width: double.infinity,
                      child: ElevatedButton(onPressed: () async {
                        SqliteData saved=SqliteData(id: details?.id,title: details?.title,overview: details?.overview,posterPath: details?.posterPath);
                        try{
                         await context.read<MovieDetailsProvider>().insertData(context, saved);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor:Colors.black,content: Center(child: Text('Saved to Watchlist',style: TextStyle(fontSize: 18),))));}
                            catch(e){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                            }
                      },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.black), child:  Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.save_alt,color: Colors.white,),
                              SizedBox(width: Dimensions.customWidth(context, 18),),
                              Text('Save',style: TextStyle(
                                  color: Colors.white,fontSize: Dimensions.customHeight(context, 41)
                              ),),
                            ],
                          ))),
                     SizedBox(
                      height: Dimensions.height10(context),
                    ),
                     CustomText(
                        text:
                        details?.overview??'No Details',
                        size: Dimensions.customHeight(context, 56.769)),
                     SizedBox(
                      height: Dimensions.height10(context),
                    ),
                   Align(alignment: Alignment.topLeft,
                      child: CustomText(text: 'More like this', size: Dimensions.height20(context))),
                   SizedBox(height: Dimensions.height10(context),),
                  FutureBuilder(future: context.read<SimiliarShowsProvider>().getSimiliar(context, details!.id.toString()),
                    builder: (context,snapshot){
                    if(snapshot.hasData){
                      return CustomGridview(similarList: snapshot.data!,);
                    }else if(snapshot.data==null){
                      return const Center(child: CustomText(text: 'No similiar movies', size: 20,));}
                    else if(snapshot.hasError){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(snapshot.error.toString())));}

                    return Text(snapshot.error.toString());
                  }
                  )],
                ),
              ),
            ),
          )),
    );
  }
}
