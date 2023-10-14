import 'package:flutter/material.dart';
import 'package:movies_app/model_class/details_class.dart';
import 'package:movies_app/utilities/dimensions.dart';
import 'package:provider/provider.dart';

import '../model_class/sqlite_data_class.dart';
import '../provider/movie_details_provider.dart';
import '../routes/class_route_names.dart';

class CustomScrollContainer extends StatelessWidget {
  CustomScrollContainer({this.image, this.details, Key? key}) : super(key: key);
  String? image;
  Details? details;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Dimensions.customHeight(context, 1.5375),
          width: Dimensions.customWidth(context, 1.019),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image ??
                      'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg'),
                  fit: BoxFit.cover)),
          child: Container(
            color: Colors.black.withOpacity(.5),
          ),
        ),
        Positioned(
            bottom: Dimensions.customHeight(context, 14.76),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: Dimensions.customWidth(context, 7.2),
                ),
                IconButton(
                  onPressed: () async {
                    SqliteData saved = SqliteData(
                        id: details?.id,
                        title: details?.title,
                        overview: details?.overview,
                        posterPath: details?.posterPath);
                    try {
                      await context
                          .read<MovieDetailsProvider>()
                          .insertData(context, saved);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.black,
                          content: Center(
                              child: Text(
                            'Saved to Watchlist',
                            style: TextStyle(fontSize: 18),
                          ))));
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
                  icon: Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: Dimensions.customWidth(context, 7.2)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.movieDetailsRoute,
                        arguments: details);
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                      ),
                      Text(
                        'Play now',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
