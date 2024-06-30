import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static Database? myDb;
  static const String DB_NAME = 'flutter_task.db';
  static const String defaultTableName = 'users';

  static Future<void> init(String tableName, List<String> columns) async {
    if (myDb != null) {
      return;
    }
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, DB_NAME);
      myDb = await openDatabase(path, version: 5,
          onCreate: (Database db, int version) async {
            String columnsString = columns.map((col) => '$col TEXT').join(', ');
            await db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnsString
          )
        ''');
          });
    } catch (ex) {
      print('Error initializing database: $ex');
    }
  }

  static Future<int> insert(String table, Map<String, dynamic> values) async {
    await init(table, values.keys.toList());
    return await myDb!.insert(table, values);
  }

  static Future<Map<String, dynamic>?> getUser(String table, String email) async {
    List<Map<String, dynamic>> results = await myDb!.query(
      table,
      where: 'email = ?',
      whereArgs: [email],
    );
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  static Future<Map<String, dynamic>?> getUserDetailsByMail(String email) async {
    await init(defaultTableName, ['name', 'email', 'password', 'address', 'latitude', 'longitude']);
    List<Map<String, dynamic>> results = await myDb!.query(
      defaultTableName,
      where: 'email = ?',
      whereArgs: [email],
    );
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }
}