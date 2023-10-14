import 'package:flutter/material.dart';
import 'package:movies_app/custom_widgets/custom_gridview.dart';
import 'package:movies_app/provider/home_provider.dart';
import 'package:movies_app/provider/search_movie_provider.dart';
import 'package:provider/provider.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: context.read<SearchMovieProvider>().getSearchMovie(context, query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isEmpty ?Center(child: Text('No movie available')): CustomGridview(similarList: snapshot.data!);

          } else if (snapshot.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(snapshot.error.toString())));
            return const Center(child: CircularProgressIndicator());
          }return Text('Error');
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
     return  FutureBuilder(
         future: context.read<SearchMovieProvider>().getSearchMovie(context, query),
         builder: (context, snapshot) {
           if (snapshot.hasData) {
             return query.isEmpty? FutureBuilder(
                 future: context.read<HomeProvider>().getApi(context),
                 builder: (context, snapshot) {
                   if (snapshot.hasData) {
                     return CustomGridview(similarList: snapshot.data!);
                   } else if (snapshot.hasError) {
                     return Text(snapshot.error.toString());
                   } else {
                     return Center(child: CircularProgressIndicator());
                   }
                 }):CustomGridview(similarList: snapshot.data!);

           } else if (snapshot.hasError) {
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(snapshot.error.toString())));
           }
           else {
             return Text('Error');
           }return const Center(child: CircularProgressIndicator());
         });

  }
}
