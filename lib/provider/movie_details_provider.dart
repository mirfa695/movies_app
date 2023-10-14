import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model_class/sqlite_data_class.dart';
import 'package:movies_app/services/sqlite_services.dart';

import '../services/api_services.dart';

class  MovieDetailsProvider extends ChangeNotifier{
  String ? data;

  final Sqliteservice=SqliteServices();
  Future<void> getVideo(BuildContext context,String movieId)async{
    try{
      data = await ApiService().movieVideo(movieId);
      print(data);
      notifyListeners();

    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
  Future insertData(BuildContext context,SqliteData details)async{
    try{
      await Sqliteservice.createDatabase();
      await Sqliteservice.insertData(details);
      notifyListeners();
    }catch(e){
      rethrow;
    }
  }
}