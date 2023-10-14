import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model_class/details_class.dart';
import '../model_class/tv_show_class.dart';
import '../services/api_services.dart';

class SimiliarShowsProvider extends ChangeNotifier{
  Future<List<Details>>getSimiliar(BuildContext context,String movieId)async{
    try{
     var movies=await ApiService().similiarMovies(movieId);
      notifyListeners();
      return movies;
    }catch(e){
      rethrow;
    }
  }
  Future<List<TvShowss>> getSimiliarShows(BuildContext context,String seriesId)async{
    try{
      var shows=await ApiService().similiarShows(seriesId);
      notifyListeners();
      return shows;
    }catch(e){
      rethrow;
    }
  }
}