import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PresensiAppDb {
  Database? db;

  PresensiAppDb() {
    getDatabasesPath().then((dbPath) {
      var path = join(dbPath, 'fpm.db');
      openDatabase(path, version: 5,
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
      }).then((database) {
        db = database;
      });
    }).onError((error, stackTrace) {
      db = null;
    });
  }

  Future close() async {
    await db?.close();
  }
}
