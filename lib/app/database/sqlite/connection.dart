import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teus_controle_lite/app/database/sqlite/script.dart';

class Connection {
  static Database? _db;
  
  static Future<Database?> get() async{
    if(_db == null) {
      var path = join(await getDatabasesPath(), 'banco');
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute(createTable);
          db.execute(inserts);
        },
      );
    }
    return _db;
  }
}