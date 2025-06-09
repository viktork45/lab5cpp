import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserScreen(),
    );
  }
}

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Database? _db;
  String status = 'Waiting...';

  @override
  void initState() {
    super.initState();
    initDB().then((db) async {
      setState(() {
        _db = db;
        status = 'DB Initialized';
      });

      // Приклад: додати користувача
      await addUser(db, 'Alice', 25);
      setState(() {
        status = 'User Added';
      });
    });
  }

  Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'users.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
      },
    );
  }

  Future<void> addUser(Database db, String name, int age) async {
    await db.insert('users', {'name': name, 'age': age});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQLite Demo')),
      body: Center(child: Text(status)),
    );
  }
}