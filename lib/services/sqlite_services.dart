import 'package:movies_app/model_class/sqlite_data_class.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteServices{
 late Database _database;
 Future<void> createDatabase()async{
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'path.db');
  _database=await openDatabase(path,version: 1,
  onCreate: (Database db,int version)async{
   await db.execute('CREATE TABLE SavedList(id INTEGER PRIMARY KEY,title TEXT,overview TEXT,posterPath TEXT)');
  });
 }
 Future insertData(SqliteData datas)async{
  print('before');
  var data=await _database.insert('SavedList',datas.toMap(),
  conflictAlgorithm: ConflictAlgorithm.replace);
  return data;
 }
 Future getData()async{
  List downloads=await _database.query('SavedList');
  return List.generate(downloads.length, (index) {
  return SqliteData(id:downloads[index]["id"],title:downloads[index]["title"],overview: downloads[index]["overview"],posterPath: downloads[index]["posterPath"] );
  });
 }
 Future<int>delete(int id)async{
  var data = await _database.delete('SavedList',where: 'id=?',whereArgs: [id]);
  return data;

 }

}