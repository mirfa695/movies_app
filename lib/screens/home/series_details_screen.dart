import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/bg_image.dart';
import 'package:movies_app/custom_widgets/custom_Ebutton.dart';
import 'package:movies_app/custom_widgets/custom_appbar.dart';
import 'package:movies_app/custom_widgets/custom_text.dart';
import 'package:movies_app/model_class/tv_show_class.dart';
import 'package:movies_app/provider/similiar_shows_provider.dart';
import 'package:movies_app/utilities/api_constants.dart';
import 'package:movies_app/utilities/dimensions.dart';
import 'package:provider/provider.dart';
import '../../custom_widgets/custom_container.dart';
import '../../routes/class_route_names.dart';

class SeriesDetails extends StatelessWidget {
   SeriesDetails({this.details,
    Key? key}) : super(key: key);
  TvShowss? details;
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
            padding:  EdgeInsets.only(top: Dimensions.customHeight(context, 8.2), left: Dimensions.width10(context), right: Dimensions.width10(context)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: Dimensions.customHeight(context, 3.69),
                  width: double.infinity,
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            details!.backdropPath==null?'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg':
                              ApiConstants.imageUrl+details!.backdropPath!),
                          fit: BoxFit.cover)),
                ),
                 CustomText(text: details?.name??'No title', size: Dimensions.customHeight(context, 36.9)),
                Row(
                  children: [
                     CustomText(text: details?.firstAirDate??'No release Date', size: Dimensions.customHeight(context, 15)),
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
                Row(
                  children: [
                    Image.asset(
                      'assets/images/img_1.png',
                      height: Dimensions.customHeight(context, 23.8),
                      width: Dimensions.customWidth(context, 12),
                    ),
                     Text(
                      'SERIES',
                      style: TextStyle(
                          color: Colors.white, fontSize: Dimensions.height15(context), letterSpacing: 2),
                    )
                  ],
                ),
                 SizedBox(
                  height: Dimensions.height10(context),
                ),
                 Ebutton(
                    text: 'play',
                    clr: Colors.white,
                    clr2: Colors.black,
                    icon: Icons.play_arrow,
                    iconclr: Colors.black),
                 SizedBox(
                  height: Dimensions.customHeight(context, 147.6),
                ),
                 Ebutton(
                    text: 'Download S1:E1',
                    clr: Colors.black,
                    clr2: Colors.white,
                    icon: Icons.save_alt,
                    iconclr: Colors.white),
                 SizedBox(
                  height: Dimensions.height10(context),
                ),
                 CustomText(
                    text:details?.overview??'No details',
                    size: Dimensions.customHeight(context, 56.769)),
                 SizedBox(
                  height: Dimensions.height10(context),
                ),
                 CustomText(text: 'More Like this', size: Dimensions.customHeight(context, 36.9)),
                FutureBuilder(future: context.read<SimiliarShowsProvider>().getSimiliarShows(context,details?.id.toString()??''),
                    builder: (context,snapshot){
                  if(snapshot.hasData){
                    return GridView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: Dimensions.width10(context),
                          mainAxisSpacing: Dimensions.height10(context),
                          crossAxisCount: 3,
                          childAspectRatio: (1 / 2),
                        ),
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(onTap: () {Navigator.pushNamed(context, RouteName.seriesDetailsRoute,arguments: snapshot.data![index]);},
                            child: CustomContainer(
                              imagelink: snapshot.data![index].posterPath == null
                                  ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyMG5Hj05J34kUvHStqq1zdC3Ym79ItDplK-Gsagk&sh"
                                  : ApiConstants.imageUrl +
                                  snapshot.data![index].posterPath!,
                            ),
                          );
                        });
                  }else if(snapshot.hasError){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(snapshot.error.toString())));
                  }else{
                    return Text(snapshot.error.toString());}
                  return const Text('Error');
                    })
              ],
            ),
          ),
        ),
      )),
    );
  }
}
