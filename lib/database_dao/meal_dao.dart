import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import '../entities/meal/meal_entity.dart';
import '../core/base_database_dao/base_database_dao.dart';

class MealDAO implements BaseDatabaseDAO<MealEntity> {
  late Database db;

  static const tableName = "meal";
  static const id = "id";
  static const name = "name";
  static const mealCategoryId = "meal_category_id";
  static const price = "price";

  static String get createTableQuery => '''
          CREATE TABLE IF NOT EXISTS $tableName (
            $id INTEGER PRIMARY KEY,
            $name TEXT,
            $mealCategoryId INTEGER,
            $price REAL
          )
          ''';

  static String get dropTableQuery => '''
    DROP TABLE IF EXISTS $tableName
   ''';

  static String get deleteTableQuery => '''
          DELETE FROM $tableName 
          ''';

  MealDAO(Database db) {
    this.db = db;
  }

  insertBatch(List<MealEntity> mealEntityList) async {
    Batch batch = db.batch();
    mealEntityList.forEach((fc) {
      batch.insert(tableName, toMap(fc));
    });
    await batch.commit(noResult: true);
  }

  Future<MealEntity> insert(MealEntity mealEntity) async {
    final resultId = await db.insert(tableName, toMap(mealEntity));
    return mealEntity.copyWith(id: resultId);
  }

  Future<void> delete(MealEntity mealEntity) async {
    await db.delete(
      tableName,
      where: id + " = ?",
      whereArgs: [mealEntity.id],
    );
  }

  Future<List<MealEntity>> getAllList() async {
    List<Map<String, dynamic>> maps = await db.query(tableName);
    return fromList(maps);
  }

  Future<List<MealEntity>> getByMealCategoryId(int mealCategoryIdQuery) async {
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT t1.$id, t1.$mealCategoryId, t1.$name, t1.$price FROM $tableName t1 "
        "WHERE t1.$mealCategoryId = $mealCategoryIdQuery ");
    return fromList(maps);
  }

  @override
  List<MealEntity> fromList(List<Map<String, dynamic>> query) {
    List<MealEntity> mealEntityList = [];
    for (Map<String, dynamic> map in query) {
      mealEntityList.add(fromMap(map));
    }
    return mealEntityList;
  }

  @override
  MealEntity fromMap(Map<String, dynamic> query) {
    return MealEntity(
      id: query[id],
      name: query[name],
      mealCategoryId: query[mealCategoryId],
      price: query[price],
    );
  }

  @override
  Map<String, dynamic> toMap(MealEntity mealEntity) {
    return <String, dynamic>{
      id: mealEntity.id,
      name: mealEntity.name,
      mealCategoryId: mealEntity.mealCategoryId,
      price: mealEntity.price,
    };
  }
}
