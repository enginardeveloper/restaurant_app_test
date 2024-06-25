import 'dart:async';

import 'package:sqflite/sqflite.dart';

abstract class DatabaseService {
  FutureOr<void> init();
  Future<Database> get database;
}

