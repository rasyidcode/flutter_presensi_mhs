import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class BaseProvider {
  Database? db;

  Future<void> open() async {
    final databasePath = await getDatabasesPath();
    final String path = join(databasePath, 'fpm.db');
    db = await openDatabase(path, version: 4,
        onCreate: (Database db, int version) async {
      await db.execute('''
        create table if not exists auth (
          id integer primary key autoincrement,
          accessToken text null,
          refreshToken text null,
          createdAt integer
        )
      ''');
      await db.execute('''
        create table if not exists firstTime (
          id integer primary key autoincrement,
          firstTime integer null,
          createdAt integer
        )
      ''');
    });
  }

  void close() {
    db?.close();
  }
}
