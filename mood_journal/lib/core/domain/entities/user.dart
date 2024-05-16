import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class User {
  final String name;
  final String email;
  final String password;

  User({required this.name, required this.email, required this.password});
}

// Future<void> insertUser(User user) async {
//   final Database db = await openDatabase(db);

//   await db.insert(
//     'Users', // Name of your existing table
//     {
//       'name': user.name,
//       'email': user.email,
//       'password' : user.password
//     },
//     conflictAlgorithm: ConflictAlgorithm.replace,
//   );
// }
