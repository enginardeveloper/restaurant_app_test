import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import '../entities/meal/meal_entity.dart';
import '../entities/table_service/table_service_entity.dart';
import '../core/base_database_dao/base_database_dao.dart';

class TableServiceDAO implements BaseDatabaseDAO<TableServiceEntity> {
  late Database db;

  static const tableName = "table_service";
  static const id = "id";
  static const name = "name";
  static const status = "status";

  static String get createTableQuery => '''
          CREATE TABLE IF NOT EXISTS $tableName (
            $id INTEGER PRIMARY KEY,
            $name TEXT,
            $status INTEGER
          )
          ''';

  static String get dropTableQuery => '''
    DROP TABLE IF EXISTS $tableName
   ''';

  static String get deleteTableQuery => '''
          DELETE FROM $tableName 
          ''';

  TableServiceDAO(Database db) {
    this.db = db;
  }

  insertBatch(List<TableServiceEntity> mealEntityList) async {
    Batch batch = db.batch();
    mealEntityList.forEach((fc) {
      batch.insert(tableName, toMap(fc));
    });
    await batch.commit(noResult: true);
  }

  Future<TableServiceEntity> update(TableServiceEntity tableServiceEntity) async {
    await db.update(tableName,
        toMap(tableServiceEntity),
        where: id + " = ?",
        whereArgs: [tableServiceEntity.id]);
    return tableServiceEntity;
  }

  Future<TableServiceEntity> insert(TableServiceEntity mealEntity) async {
    final resultId = await db.insert(tableName, toMap(mealEntity));
    return mealEntity.copyWith(id: resultId);
  }

  Future<void> delete(TableServiceEntity mealEntity) async {
    await db.delete(
      tableName,
      where: id + " = ?",
      whereArgs: [mealEntity.id],
    );
  }

  Future<List<TableServiceEntity>> getAllList() async {
    List<Map<String, dynamic>> maps = await db.query(tableName);
    return fromList(maps);
  }

  @override
  List<TableServiceEntity> fromList(List<Map<String, dynamic>> query) {
    List<TableServiceEntity> mealEntityList = [];
    for (Map<String, dynamic> map in query) {
      mealEntityList.add(fromMap(map));
    }
    return mealEntityList;
  }

  @override
  TableServiceEntity fromMap(Map<String, dynamic> query) {
    return TableServiceEntity(
      id: query[id],
      name: query[name],
      status: query[status],
    );
  }

  @override
  Map<String, dynamic> toMap(TableServiceEntity mealEntity) {
    return <String, dynamic>{
      id: mealEntity.id,
      name: mealEntity.name,
      status: mealEntity.status,
    };
  }
}
