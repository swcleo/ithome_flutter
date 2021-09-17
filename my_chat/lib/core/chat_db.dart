// ignore_for_file: avoid_print

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/message.dart';

class ChatDB {
  static final ChatDB _instance = ChatDB._internal();

  Database? _db;

  ChatDB._internal();

  factory ChatDB() {
    return _instance;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    return _db ??= await openDatabase(
      join(dbPath, 'chat.sqlite'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE chat(id INTEGER PRIMARY KEY, by TEXT, msg TEXT, mid TEXT, time INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future insert(Message msg) async {
    final db = await _initDB();

    await db.insert(
      'chat',
      msg.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Message>> query() async {
    final db = await _initDB();
    final List<Map<String, dynamic>> maps =
        await db.rawQuery('SELECT * FROM chat ORDER BY time DESC LIMIT 30;');

    var data = List.generate(maps.length, (i) {
      return Message.fromJson(maps[i]);
    });

    return List.from(data.reversed);
  }

  Future<int> delete(String mid) async {
    final db = await _initDB();
    return await db.rawDelete('DELETE FROM chat WHERE mid = ?', [mid]);
  }

  Future<void> close() async {
    final db = await _initDB();
    await db.close();
  }
}
