import 'package:flutter/material.dart';
import '../model_class/details_class.dart';
import '../services/api_services.dart';

class HomeProvider with ChangeNotifier{

  int screenIndex=0;
  int get fetchCurrentIndex{
    return screenIndex;
  }
  void updateScreenIndex(int newIndex){
    screenIndex=newIndex;
    notifyListeners();
  }
  Future<List<Details>> getApi(BuildContext context)async{
    try{
      var data=await ApiService().popularMovie();
      notifyListeners();
      return data;
    }
    catch(e){
      rethrow;
    }
  }
}