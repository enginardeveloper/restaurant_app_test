import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import '../../entities/meal_category/meal_category_entity.dart';
import '../core/base_database_dao/base_database_dao.dart';

class MealCategoryDAO implements BaseDatabaseDAO<MealCategoryEntity> {
  late Database db;

  static const tableName = "meal_category";
  static const id = "id";
  static const name = "name";

  static String get createTableQuery => '''
          CREATE TABLE IF NOT EXISTS $tableName (
            $id INTEGER PRIMARY KEY,
            $name TEXT
          )
          ''';

  static String get dropTableQuery => '''
    DROP TABLE IF EXISTS $tableName
   ''';

  static String get deleteTableQuery => '''
          DELETE FROM $tableName 
          ''';

  MealCategoryDAO(Database db) {
    this.db = db;
  }

  insertBatch(List<MealCategoryEntity> mealEntityList) async {
    Batch batch = db.batch();
    mealEntityList.forEach((fc) {
      batch.insert(tableName, toMap(fc));
    });
    await batch.commit(noResult: true);
  }

  Future<MealCategoryEntity> insert(MealCategoryEntity mealEntity) async {
    final resultId = await db.insert(tableName, toMap(mealEntity));
    return mealEntity.copyWith(id: resultId);
  }

  Future<void> delete(MealCategoryEntity mealEntity) async {
    await db.delete(
      tableName,
      where: id + " = ?",
      whereArgs: [mealEntity.id],
    );
  }

  Future<List<MealCategoryEntity>> getAllList() async {
    List<Map<String, dynamic>> maps = await db.query(tableName);
    return fromList(maps);
  }

  @override
  List<MealCategoryEntity> fromList(List<Map<String, dynamic>> query) {
    List<MealCategoryEntity> mealEntityList = [];
    for (Map<String, dynamic> map in query) {
      mealEntityList.add(fromMap(map));
    }
    return mealEntityList;
  }

  @override
  MealCategoryEntity fromMap(Map<String, dynamic> query) {
    return MealCategoryEntity(
      id: query[id],
      name: query[name],
    );
  }

  @override
  Map<String, dynamic> toMap(MealCategoryEntity mealEntity) {
    return <String, dynamic>{
      id: mealEntity.id,
      name: mealEntity.name,
    };
  }
}
