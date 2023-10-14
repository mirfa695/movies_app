import 'package:flutter/material.dart';
import 'package:movies_app/model_class/tv_show_class.dart';

import '../model_class/details_class.dart';
import '../services/api_services.dart';

class CategoriesProvider with ChangeNotifier{
  List<Details>? details;
  List<TvShowss>? shows;
  List<Details>? movies;
  Future<void> getTopRated(BuildContext context)async{
    try{
      movies=await ApiService().topRated();
      notifyListeners();
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
  Future getUpComing(BuildContext context)async{
    try{
      details=await ApiService().upComing();
      notifyListeners();
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
  Future getTvShows(BuildContext context)async{
    try{
      shows=await ApiService().tvShows();
      notifyListeners();
    }catch(e){ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));}
  }
}