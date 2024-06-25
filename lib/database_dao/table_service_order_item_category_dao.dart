import 'package:sqflite/sqflite.dart';
import '../entities/table_service_order_item/table_service_order_item_entity.dart';
import '../core/base_database_dao/base_database_dao.dart';

class TableServiceOrderItemDAO implements BaseDatabaseDAO<TableServiceOrderItemEntity> {
  late Database db;

  static const tableName = "table_service_order_item";
  static const id = "id";
  static const tableServiceId = "table_service_id";
  static const mealId = "meal_id";
  static const mealName = "meal_name";
  static const mealCount = "meal_count";
  static const priceSum = "price_sum";

  static String get createTableQuery => '''
          CREATE TABLE IF NOT EXISTS $tableName (
            $id INTEGER PRIMARY KEY,
            $tableServiceId INTEGER,
            $mealId INTEGER,
            $mealName TEXT,
            $mealCount INTEGER,
            $priceSum REAL
          )
          ''';

  static String get dropTableQuery => '''
    DROP TABLE IF EXISTS $tableName
   ''';

  static String get deleteTableQuery => '''
          DELETE FROM $tableName 
          ''';

  TableServiceOrderItemDAO(Database db) {
    this.db = db;
  }

  insertBatch(List<TableServiceOrderItemEntity> tableServiceOrderItemEntityList) async {
    Batch batch = db.batch();
    tableServiceOrderItemEntityList.forEach((fc) {
      batch.insert(tableName, toMap(fc));
    });
    await batch.commit(noResult: true);
  }

  Future<TableServiceOrderItemEntity> insert(TableServiceOrderItemEntity tableServiceOrderItemEntity) async {
    final resultId = await db.insert(tableName, toMap(tableServiceOrderItemEntity));
    return tableServiceOrderItemEntity.copyWith(id: resultId);
  }

  Future<void> delete(TableServiceOrderItemEntity tableServiceOrderItemEntity) async {
    await db.delete(
      tableName,
      where: id + " = ?",
      whereArgs: [tableServiceOrderItemEntity.id],
    );
  }

  Future<List<TableServiceOrderItemEntity>> getAllList() async {
    List<Map<String, dynamic>> maps = await db.query(tableName);
    return fromList(maps);
  }


  Future<List<TableServiceOrderItemEntity>> getByTableServiceId(int tableServiceIdQuery) async {
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT t1.$id, t1.$tableServiceId, t1.$mealId, t1.$mealName, t1.$mealCount, t1.$priceSum FROM $tableName t1 "
        "WHERE t1.$tableServiceId = $tableServiceIdQuery ");
    return fromList(maps);
  }

  @override
  List<TableServiceOrderItemEntity> fromList(List<Map<String, dynamic>> query) {
    List<TableServiceOrderItemEntity> tableServiceOrderItemEntityList = [];
    for (Map<String, dynamic> map in query) {
      tableServiceOrderItemEntityList.add(fromMap(map));
    }
    return tableServiceOrderItemEntityList;
  }

  @override
  TableServiceOrderItemEntity fromMap(Map<String, dynamic> query) {
    return TableServiceOrderItemEntity(
      id: query[id],
      tableServiceId: query[tableServiceId],
      mealId: query[mealId],
      mealName: query[mealName],
      mealCount: query[mealCount],
      priceSum: query[priceSum],
    );
  }

  @override
  Map<String, dynamic> toMap(TableServiceOrderItemEntity tableServiceOrderItemEntity) {
    return <String, dynamic>{
      id: tableServiceOrderItemEntity.id,
      tableServiceId: tableServiceOrderItemEntity.tableServiceId,
      mealId: tableServiceOrderItemEntity.mealId,
      mealName: tableServiceOrderItemEntity.mealName,
      mealCount: tableServiceOrderItemEntity.mealCount,
      priceSum: tableServiceOrderItemEntity.priceSum,
    };
  }
}
