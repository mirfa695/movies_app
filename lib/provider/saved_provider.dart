import 'package:flutter/material.dart';
import 'package:movies_app/model_class/sqlite_data_class.dart';
import 'package:movies_app/services/sqlite_services.dart';

class SavedProvider extends ChangeNotifier{
    List<SqliteData> downloads=[];
    var data=SqliteServices();
  Future<void> getData()async{
    try{
      await data.createDatabase();
      downloads=await data.getData();
      print(downloads[0].title);
    notifyListeners();
    }
        catch(e){
      rethrow;}
  }
  Future<void> deletedata(int id,int index)async{
    try{
     await data.delete(id);

      downloads.removeAt(index);


      notifyListeners();

    }
        catch(e){print(e);}
  }
}