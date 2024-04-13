import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDb {
  static final String _dbName = 'tasks_app.db';
  static Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initializeDb();
    }
    return _db!;
  }

  Future<Database> _initializeDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _dbName);

    return await openDatabase(
      path,
      version: 1, // Change version number for schema changes
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS alltasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            todo TEXT NOT NULL,
            completed TINYINT NOT NULL DEFAULT 0,
            userId INTEGER NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS mytasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            todo TEXT NOT NULL,
            completed TINYINT NOT NULL DEFAULT 0,
            userId INTEGER NOT NULL
          )
        ''');
        print(
            "============= Database tables created successfully! ==============");
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        // Handle database schema upgrades here if necessary
        print(
            "============= Database upgraded from $oldVersion to $newVersion ==============");
      },
    );
  }

  Future<List<Map<String, dynamic>>> getData(String sql) async {
    final db = await this.db;
    final response = await db.rawQuery(sql);
    return response;
  }

  Future<int> insertData(String sql) async {
    try {
      final db = await this.db;
      final response = await db.rawInsert(sql);
      return response;
    } on Exception catch (e) {
      print(e.toString());
      final db = await this.db;
      final response = await db.rawInsert(
          '''INSERT INTO alltasks (todo, completed, userId) VALUES ('',0, 0);''');
      return response;
    }
  }

  Future<int> updateData(String sql) async {
    try {
      final db = await this.db;
      final response = await db.rawUpdate(sql);
      return response;
    } on Exception catch (e) {
      final db = await this.db;
      final response = await db.rawUpdate('''
  UPDATE alltasks
  SET completed = 1
  WHERE userId = 0;
''');
      return response;
    }
  }

  Future<int> deleteData(String sql) async {
    final db = await this.db;
    final response = await db.rawDelete(sql);
    return response;
  }
}
