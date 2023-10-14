import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model_class/details_class.dart';
import '../services/api_services.dart';

class SearchMovieProvider extends ChangeNotifier{
  Future<List<Details>>getSearchMovie(BuildContext context,String query)async{
    try{
      var movies =await ApiService().searchMovie(query);
      notifyListeners();
      return movies;
    }catch(e){
      rethrow;
    }
  }
}