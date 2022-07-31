import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PresensiAppDb {
  Future<Database>? db;

  PresensiAppDb(String path) {
    db = openDatabase(join(path, 'fpm.db'), version: 6,
        onCreate: (Database dbs, int version) async {
      await dbs.execute('''
        create table if not exists auth (
          id integer primary key autoincrement,
          accessToken text null,
          refreshToken text null,
          createdAt integer
        )
      ''');
      await dbs.execute('''
        create table if not exists firstTime (
          id integer primary key autoincrement,
          firstTime integer null,
          createdAt integer
        )
      ''');
    });
  }

  Future close() async {
    db?.then((value) => value.close());
  }
}
