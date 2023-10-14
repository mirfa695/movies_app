import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/custom_appbar.dart';
import 'package:movies_app/provider/saved_provider.dart';
import 'package:movies_app/provider/similiar_shows_provider.dart';
import 'package:movies_app/routes/class_route_names.dart';
import 'package:movies_app/utilities/api_constants.dart';
import 'package:movies_app/utilities/dimensions.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import '../../custom_widgets/bg_image.dart';
import '../../custom_widgets/custom_text.dart';
class WatchListScreen extends StatefulWidget {
  const WatchListScreen({Key? key}) : super(key: key);
  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    var data=context.read<SavedProvider>();
    data.getData();
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: CustomAppbar(),
        body: BgImage(
          wd: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(.3),
            child: Padding(
              padding:  EdgeInsets.only(top: Dimensions.customHeight(context, 7.38)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                     CustomText(text: 'Watch List', size: Dimensions.height20(context)),
                     SizedBox(height: Dimensions.height10(context),),
                    Consumer<SavedProvider>(builder: (context, value, child) {
                      return value.downloads.isEmpty?const Text('No saved movies',style: TextStyle(color: Colors.white),):
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: value.downloads.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(onTap: (){
                              Navigator.pushNamed(context, RouteName.movieDetailsRoute,arguments: value.downloads[index]);
                            },
                              child: ListTile(
                                leading: Container(height: Dimensions.customHeight(context, 8.2), width: Dimensions.customWidth(context, 3.6),
                                    decoration: BoxDecoration(image: DecorationImage(
                                        image: NetworkImage(value.downloads[index].posterPath!=null?
                                            ApiConstants.imageUrl+value.downloads[index].posterPath!:
                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png'),
                                        fit: BoxFit.cover))),
                                title: Text(value.downloads[index].title?? 'No title',
                                  style:  TextStyle(color: Colors.white, fontSize: Dimensions.width20(context),),),
                                subtitle: ReadMoreText(value.downloads[index].overview ?? 'no overview',
                                  style:  TextStyle(color: Colors.white, fontSize: Dimensions.height10(context),

                                  ), trimLength: 80,),
                                trailing: IconButton(
                                  onPressed:()async{
                                    await value.deletedata(value.downloads[index].id??0,index);
                                  }

                                  //context.read<SavedProvider>().deletedata(id ?? 0);

                                  , icon: const Icon(Icons.delete, color: Colors.white,),),
                              ),
                            );
                          } );
                      }),
                     SizedBox(height: Dimensions.customHeight(context, 24.6),),
                    FutureBuilder(
                      future: context.read<SimiliarShowsProvider>().getSimiliar(context, data.downloads.isEmpty?'565770':data.downloads![0].id!.toString()),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        if(snapshot.hasData) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(right: Dimensions.customWidth(context, 10.2857),
                                    left: Dimensions.customWidth(context, 10.2857)),
                                child: Container(
                                  height: Dimensions.customHeight(context, 3.51428),
                                  width: Dimensions.customWidth(context, 1.714),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(100)
                                    //more than 50% of width makes circle
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                child: Transform.rotate(
                                    angle: -.3,
                                    child: Container(
                                      height: Dimensions.customHeight(context, 4.1),
                                      width: Dimensions.customWidth(context, 3),
                                      decoration: BoxDecoration(
                                          image:  DecorationImage(
                                              image: NetworkImage(snapshot.data![0].posterPath!=null?
                                                 ApiConstants.imageUrl+snapshot.data![0].posterPath!:ApiConstants.defaultImage),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.circular(
                                              20)),
                                    )),
                              ),
                              Positioned(
                                  right: 0,
                                  child: Transform.rotate(
                                      angle: .3,
                                      child: Container(
                                        height: Dimensions.customHeight(context, 4.1),
                                        width: Dimensions.customWidth(context, 3),
                                        decoration: BoxDecoration(
                                            image:  DecorationImage(
                                                image: NetworkImage(snapshot.data![1].posterPath!=null?
                                                    ApiConstants.imageUrl+snapshot.data![1].posterPath!:ApiConstants.defaultImage),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(
                                                20)),
                                      ))),
                              Container(
                                height: Dimensions.customHeight(context, 4.1),
                                width: Dimensions.customWidth(context, 3),
                                decoration: BoxDecoration(
                                    image:  DecorationImage(
                                        image: NetworkImage(
                                            snapshot.data![1].posterPath!=null?
                                            ApiConstants.imageUrl+snapshot.data![2].posterPath!:ApiConstants.defaultImage),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(20)),
                              )
                            ],
                          );
                        }else if(snapshot.hasError){return Text(snapshot.error.toString());}
                        else{return const Text('Error');}
                      } ),
                    InkWell(onTap: (){
                      Navigator.pushNamed(context, RouteName.categoriesRoute);
                    },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.white.withOpacity(.3),
                        child:  CustomText(text: 'Find more to download', size: Dimensions.height15(context)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
