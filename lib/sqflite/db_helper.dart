import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;

  DBHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'asgard_people.db'),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE people (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            surname TEXT,
            age INTEGER,
            email TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  Future<int> insertPerson(Map<String, dynamic> person) async {
    final db = await database;
    return db.insert('people', person);
  }

  Future<List<Map<String, dynamic>>> getAllPeople() async {
    final db = await database;
    return db.query('people');
  }
}
